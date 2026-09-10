import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'image_service.dart';

class ImagePickerService implements ImageService {
  final ImagePicker picker;
  ImagePickerService({ImagePicker? picker}) : picker = picker ?? ImagePicker();

  @override
  Future<File?> pickFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery, imageQuality: 92);
    return file == null ? null : File(file.path);
  }

  @override
  Future<File?> takePhoto() async {
    final file = await picker.pickImage(source: ImageSource.camera, imageQuality: 92);
    return file == null ? null : File(file.path);
  }

  @override
  Future<File> enhance(File image) async => image;

  @override
  Future<ImageEnhancementResult> enhanceWithReport(File image) async => ImageEnhancementResult(
        file: image,
        backgroundRemoved: false,
        autoCropped: false,
        lightingCorrected: false,
        studioBackground: false,
      );
}
