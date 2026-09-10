import 'dart:convert';
import '../../core/config/app_config.dart';
import '../../core/errors/app_exception.dart';
import '../../models/product.dart';
import 'ondc_service.dart';

class OndcAdapter implements OndcService {
  @override
  Future<String> createSellerPayload(Product product) async {
    // This is intentionally a normalized seller-side payload. Actual ONDC
    // publication requires participant onboarding, signing, gateway details,
    // domain/category mapping and network-specific configuration.
    return jsonEncode({
      'context': {'domain': 'ONDC:RET10', 'action': 'on_search'},
      'message': {
        'catalog': {
          'id': product.id,
          'descriptor': {'name': product.title},
          'category': product.category,
          'description': product.description,
          'price': product.recommendedPrice,
          'attributes': {
            'material': product.material,
            'color': product.color,
            'design': product.design,
            'type': product.type,
            'length': product.length,
            'width': product.width,
            'weight': product.weight,
          },
        }
      }
    });
  }

  @override
  Future<void> publish(Product product) async {
    if (!AppConfig.ondcEnabled || AppConfig.ondcBaseUrl.isEmpty) {
      throw const AppException('ONDC is not configured. Seller participant credentials and network endpoint are required.');
    }
    // Replace this adapter call with your ONDC seller-network implementation.
    throw const AppException('ONDC adapter placeholder reached. Complete participant onboarding and API signing first.');
  }
}
