import 'dart:io';
import '../../models/product.dart';

abstract class AiService {
  Future<Product> generateCatalog({
    required Product product,
    required String transcript,
    required String outputLanguage,
    File? image,
  });

  Future<String> analyzeImage(File image);
}
