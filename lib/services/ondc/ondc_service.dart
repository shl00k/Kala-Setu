import '../../models/product.dart';

abstract class OndcService {
  Future<String> createSellerPayload(Product product);
  Future<void> publish(Product product);
}
