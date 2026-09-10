import '../models/product.dart';
import '../services/backend/backend_service.dart';
import '../services/storage/local_storage_service.dart';

class ProductRepository {
  final LocalStorageService localStorage;
  final BackendService backend;

  ProductRepository({required this.localStorage, required this.backend});

  Future<void> save(Product product) async {
    await localStorage.saveProduct(product.copyWith(synced: false));
    try {
      await backend.syncProduct(product);
      await localStorage.saveProduct(product.copyWith(synced: true));
    } catch (_) {
      // Offline-first: local save remains successful.
    }
  }

  Future<List<Product>> getAll() => localStorage.getProducts();

  Future<void> delete(String id) => localStorage.deleteProduct(id);

  Future<void> syncAll() async {
    final products = await localStorage.getProducts();
    for (final product in products.where((p) => !p.synced)) {
      try {
        await backend.syncProduct(product);
        await localStorage.saveProduct(product.copyWith(synced: true));
      } catch (_) {}
    }
  }
}
