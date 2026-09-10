import '../../models/product.dart';

abstract class LocalStorageService {
  Future<void> saveProduct(Product product);
  Future<List<Product>> getProducts();
  Future<void> deleteProduct(String id);
}
