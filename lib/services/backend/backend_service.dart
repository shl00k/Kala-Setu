import '../../models/product.dart';

abstract class BackendService {
  Future<void> syncProduct(Product product);
  Future<List<Product>> fetchProducts();
}
