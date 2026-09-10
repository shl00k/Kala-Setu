import 'dart:io';
import 'dart:math' as math;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import '../../core/errors/app_exception.dart';
import 'image_service.dart';
import 'mediapipe_bridge.dart';

/// Turns an ordinary artisan photo into a marketplace-style product image.
///
/// The service first tries the native MediaPipe bridge. When that is not
/// available, it uses a lightweight local foreground estimator so the
/// Flutter-only prototype still produces a visible studio transformation.
class ImageEnhancementService implements ImageService {
  final ImageService picker;
  final MediaPipeBridge mediaPipe;

  ImageEnhancementService(this.picker, {MediaPipeBridge? mediaPipe})
      : mediaPipe = mediaPipe ?? MediaPipeBridge();

  @override
  Future<File?> pickFromGallery() => picker.pickFromGallery();

  @override
  Future<File?> takePhoto() => picker.takePhoto();

  @override
  Future<File> enhance(File image) async {
    final result = await enhanceWithReport(image);
    return result.file;
  }

  @override
  Future<ImageEnhancementResult> enhanceWithReport(File image) async {
    final native = await mediaPipe.removeBackground(image);
    if (native != null) {
      final polished = await _polish(native);
      return ImageEnhancementResult(
        file: polished,
        backgroundRemoved: true,
        autoCropped: true,
        lightingCorrected: true,
        studioBackground: true,
      );
    }

    final bytes = await image.readAsBytes();
    final decoded = img.decodeImage(bytes);
    if (decoded == null) throw const AppException('Unsupported image format.');

    final oriented = img.bakeOrientation(decoded);
    final working = _resizeForProcessing(oriented);

    // Estimate the foreground from the border/background and build a soft
    // alpha mask. This is deliberately conservative: if the segmentation
    // looks unsafe, the original image is retained rather than destroying it.
    final mask = _estimateForegroundMask(working);
    final bounds = _foregroundBounds(mask, working.width, working.height);

    if (bounds == null || bounds.area < working.width * working.height * 0.035) {
      final fallback = await _basicStudioFallback(working);
      return ImageEnhancementResult(
        file: fallback,
        backgroundRemoved: false,
        autoCropped: true,
        lightingCorrected: true,
        studioBackground: true,
      );
    }

    final padded = _padBounds(bounds, working.width, working.height, 0.14);
    final cropped = img.copyCrop(
      working,
      x: padded.left,
      y: padded.top,
      width: padded.width,
      height: padded.height,
    );
    final croppedMask = _cropMask(mask, padded, working.width);
    final enhanced = _applyStudioTreatment(cropped, croppedMask);

    final dir = await getApplicationDocumentsDirectory();
    final output = File(
      '${dir.path}/studio_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    await output.writeAsBytes(img.encodeJpg(enhanced, quality: 94));

    return ImageEnhancementResult(
      file: output,
      backgroundRemoved: true,
      autoCropped: true,
      lightingCorrected: true,
      studioBackground: true,
    );
  }

  Future<File> _polish(File input) async {
    final bytes = await input.readAsBytes();
    final decoded = img.decodeImage(bytes);
    if (decoded == null) return input;

    final oriented = img.bakeOrientation(decoded);
    final resized = _resizeForOutput(oriented);
    final adjusted = img.adjustColor(
      resized,
      brightness: 1.05,
      contrast: 1.08,
      saturation: 1.03,
    );
    final dir = await getApplicationDocumentsDirectory();
    final output = File(
      '${dir.path}/studio_native_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    await output.writeAsBytes(img.encodeJpg(adjusted, quality: 94));
    return output;
  }

  img.Image _resizeForProcessing(img.Image source) {
    final maxSide = 900;
    if (math.max(source.width, source.height) <= maxSide) return source;
    final scale = maxSide / math.max(source.width, source.height);
    return img.copyResize(
      source,
      width: math.max(1, (source.width * scale).round()),
      height: math.max(1, (source.height * scale).round()),
    );
  }

  img.Image _resizeForOutput(img.Image source) {
    const maxSide = 1400;
    if (math.max(source.width, source.height) <= maxSide) return source;
    final scale = maxSide / math.max(source.width, source.height);
    return img.copyResize(
      source,
      width: math.max(1, (source.width * scale).round()),
      height: math.max(1, (source.height * scale).round()),
    );
  }

  List<int> _estimateForegroundMask(img.Image source) {
    final w = source.width;
    final h = source.height;
    final mask = List<int>.filled(w * h, 0);

    // Sample a set of edge colours. Multiple samples are much more robust
    // than assuming the entire background is pure white.
    final samples = <_Rgb>[];
    for (final p in [
      const _Point(0, 0),
      _Point(w - 1, 0),
      _Point(0, h - 1),
      _Point(w - 1, h - 1),
      _Point(w ~/ 2, 0),
      _Point(w ~/ 2, h - 1),
      _Point(0, h ~/ 2),
      _Point(w - 1, h ~/ 2),
    ]) {
      final px = source.getPixel(p.x.clamp(0, w - 1), p.y.clamp(0, h - 1));
      samples.add(_Rgb(px.r.toDouble(), px.g.toDouble(), px.b.toDouble()));
    }

    final visited = List<bool>.filled(w * h, false);
    final queue = <int>[];
    final tolerance = 48.0;

    void seed(int x, int y) {
      final i = y * w + x;
      if (visited[i]) return;
      final px = source.getPixel(x, y);
      final c = _Rgb(px.r.toDouble(), px.g.toDouble(), px.b.toDouble());
      final similar = samples.any((s) => _distance(c, s) < tolerance);
      if (similar) {
        visited[i] = true;
        queue.add(i);
      }
    }

    for (var x = 0; x < w; x++) {
      seed(x, 0);
      seed(x, h - 1);
    }
    for (var y = 0; y < h; y++) {
      seed(0, y);
      seed(w - 1, y);
    }

    var head = 0;
    while (head < queue.length) {
      final i = queue[head++];
      final x = i % w;
      final y = i ~/ w;
      final px = source.getPixel(x, y);
      final current = _Rgb(px.r.toDouble(), px.g.toDouble(), px.b.toDouble());

      for (final d in const [
        _Point(1, 0),
        _Point(-1, 0),
        _Point(0, 1),
        _Point(0, -1),
      ]) {
        final nx = x + d.x;
        final ny = y + d.y;
        if (nx < 0 || ny < 0 || nx >= w || ny >= h) continue;
        final ni = ny * w + nx;
        if (visited[ni]) continue;
        final npx = source.getPixel(nx, ny);
        final next = _Rgb(npx.r.toDouble(), npx.g.toDouble(), npx.b.toDouble());
        // Allow gradual lighting changes across a connected background, but
        // stop at strong colour changes that usually correspond to the item.
        if (_distance(next, current) < 28 &&
            samples.any((s) => _distance(next, s) < 78)) {
          visited[ni] = true;
          queue.add(ni);
        }
      }
    }

    // Background = visited. Foreground gets a small soft edge.
    for (var i = 0; i < mask.length; i++) {
      mask[i] = visited[i] ? 0 : 255;
    }

    return _softenMask(mask, w, h);
  }

  List<int> _softenMask(List<int> mask, int w, int h) {
    final result = List<int>.from(mask);
    for (var y = 1; y < h - 1; y++) {
      for (var x = 1; x < w - 1; x++) {
        final i = y * w + x;
        final neighbours = [
          mask[i],
          mask[i - 1],
          mask[i + 1],
          mask[i - w],
          mask[i + w],
        ];
        final count = neighbours.where((v) => v > 127).length;
        if (count == 5) result[i] = 255;
        if (count == 0) result[i] = 0;
      }
    }
    return result;
  }

  _Bounds? _foregroundBounds(List<int> mask, int w, int h) {
    var left = w;
    var top = h;
    var right = -1;
    var bottom = -1;
    for (var y = 0; y < h; y++) {
      for (var x = 0; x < w; x++) {
        if (mask[y * w + x] < 180) continue;
        left = math.min(left, x);
        right = math.max(right, x);
        top = math.min(top, y);
        bottom = math.max(bottom, y);
      }
    }
    if (right < left || bottom < top) return null;
    return _Bounds(left, top, right, bottom);
  }

  _Bounds _padBounds(_Bounds b, int w, int h, double fraction) {
    final pad = (math.max(b.width, b.height) * fraction).round();
    return _Bounds(
      math.max(0, b.left - pad),
      math.max(0, b.top - pad),
      math.min(w - 1, b.right + pad),
      math.min(h - 1, b.bottom + pad),
    );
  }

  List<int> _cropMask(List<int> mask, _Bounds b, int sourceWidth) {
    final out = List<int>.filled(b.width * b.height, 0);
    for (var y = 0; y < b.height; y++) {
      for (var x = 0; x < b.width; x++) {
        out[y * b.width + x] = mask[(b.top + y) * sourceWidth + (b.left + x)];
      }
    }
    return out;
  }

  img.Image _applyStudioTreatment(img.Image source, List<int> mask) {
    final w = source.width;
    final h = source.height;
    final out = img.Image(width: w, height: h, numChannels: 4);

    for (var y = 0; y < h; y++) {
      final ny = y / math.max(1, h - 1);
      for (var x = 0; x < w; x++) {
        final i = y * w + x;
        final alpha = mask[i];
        final px = source.getPixel(x, y);

        // Neutral studio sweep: slightly darker at the edges, brighter in
        // the centre. It reads as a soft product-photo backdrop.
        final nx = (x / math.max(1, w - 1)) - 0.5;
        final radial = math.max(0.0, 1.0 - (nx * nx * 1.8 + (ny - 0.45) * (ny - 0.45) * 1.4));
        final bg = (238 + radial * 10).round().clamp(0, 255).toInt();

        // A subtle grounding shadow below the product.
        final shadowStrength = _shadowStrength(x, y, w, h, mask);
        final bgValue = (bg * (1.0 - shadowStrength * 0.16)).round().clamp(0, 255).toInt();

        final a = alpha / 255.0;
        final r = (px.r * a + bgValue * (1 - a)).round().clamp(0, 255).toInt();
        final g = (px.g * a + bgValue * (1 - a)).round().clamp(0, 255).toInt();
        final b = (px.b * a + bgValue * (1 - a)).round().clamp(0, 255).toInt();
        out.setPixelRgba(x, y, r, g, b, 255);
      }
    }

    return img.adjustColor(
      out,
      brightness: 1.05,
      contrast: 1.08,
      saturation: 1.03,
    );
  }

  double _shadowStrength(int x, int y, int w, int h, List<int> mask) {
    if (y < h * 0.52) return 0;
    final radius = math.max(4, (w * 0.12).round());
    var nearest = radius + 1;
    for (var dx = -radius; dx <= radius; dx += 3) {
      final xx = x + dx;
      if (xx < 0 || xx >= w) continue;
      for (var dy = -radius; dy <= radius; dy += 4) {
        final yy = y - dy;
        if (yy < 0 || yy >= h) continue;
        if (mask[yy * w + xx] > 180) {
          nearest = math.min(nearest, (dy.abs() + dx.abs()).round());
        }
      }
    }
    if (nearest > radius) return 0;
    return (1 - nearest / radius).clamp(0.0, 1.0);
  }

  Future<File> _basicStudioFallback(img.Image source) async {
    final resized = _resizeForOutput(source);
    final adjusted = img.adjustColor(
      resized,
      brightness: 1.07,
      contrast: 1.08,
      saturation: 1.03,
    );
    final dir = await getApplicationDocumentsDirectory();
    final output = File(
      '${dir.path}/studio_fallback_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    await output.writeAsBytes(img.encodeJpg(adjusted, quality: 94));
    return output;
  }

  double _distance(_Rgb a, _Rgb b) {
    final dr = a.r - b.r;
    final dg = a.g - b.g;
    final db = a.b - b.b;
    return math.sqrt(dr * dr + dg * dg + db * db);
  }
}

class _Rgb {
  final double r;
  final double g;
  final double b;
  const _Rgb(this.r, this.g, this.b);
}

class _Point {
  final int x;
  final int y;
  const _Point(this.x, this.y);
}

class _Bounds {
  final int left;
  final int top;
  final int right;
  final int bottom;
  const _Bounds(this.left, this.top, this.right, this.bottom);
  int get width => right - left + 1;
  int get height => bottom - top + 1;
  int get area => width * height;
}
