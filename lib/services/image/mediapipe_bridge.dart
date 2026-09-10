import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MediaPipeBridge {
  static const _channel = MethodChannel('kaal_setu/mediapipe');

  Future<File?> removeBackground(File input) async {
    try {
      final output = await _channel.invokeMethod<String>('removeBackground', {
        'path': input.path,
      });

      if (output == null || output.isEmpty) {
        return null;
      }

      final file = File(output);

      if (await file.exists()) {
        return file;
      }

      return null;
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return null;
    }
  }

  Future<File?> removeBackgroundAtPoint(File input, double x, double y) async {
    try {
      final output = await _channel.invokeMethod<String>(
        'removeBackgroundAtPoint',
        {'path': input.path, 'x': x, 'y': y},
      );

      if (output == null || output.isEmpty) {
        return null;
      }

      final file = File(output);

      if (await file.exists()) {
        return file;
      }

      return null;
    } on PlatformException catch (e) {
      debugPrint('MediaPipe segmentation failed: ${e.message}');

      return null;
    } on MissingPluginException {
      return null;
    }
  }
}
