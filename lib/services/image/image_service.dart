import 'dart:io';

class ImageEnhancementResult {
  final File file;
  final bool backgroundRemoved;
  final bool autoCropped;
  final bool lightingCorrected;
  final bool studioBackground;

  const ImageEnhancementResult({
    required this.file,
    required this.backgroundRemoved,
    required this.autoCropped,
    required this.lightingCorrected,
    required this.studioBackground,
  });
}

abstract class ImageService {
  Future<File?> pickFromGallery();
  Future<File?> takePhoto();
  Future<File> enhance(File image);
  Future<ImageEnhancementResult> enhanceWithReport(File image);
}
