import '../../data/local/app_database.dart';
import '../../data/local/product_mapper.dart';
import '../../models/product.dart' as domain;
import 'local_storage_service.dart';

class DriftLocalStorageService implements LocalStorageService {
  final AppDatabase db;

  DriftLocalStorageService(this.db);

  @override
  Future<void> saveProduct(domain.Product product) =>
      db.upsertProduct(productToRow(product));

  @override
  Future<List<domain.Product>> getProducts() async {
    final rows = await db.readProducts();
    return rows.map(productFromRow).toList();
  }

  @override
  Future<void> deleteProduct(String id) => db.deleteProduct(id);
}
