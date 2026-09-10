import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/config/app_config.dart';
import '../../models/product.dart';
import 'backend_service.dart';

class SupabaseBackendService implements BackendService {
  SupabaseClient? get _client => AppConfig.hasSupabase ? Supabase.instance.client : null;

  @override
  Future<void> syncProduct(Product product) async {
    final client = _client;
    if (client == null) return;

    String? remoteImageUrl;
    final image = product.imagePath.isNotEmpty ? File(product.imagePath) : null;
    if (image != null && await image.exists()) {
      final objectPath = 'products/${product.id}.jpg';
      await client.storage.from('product-images').upload(
            objectPath,
            image,
            fileOptions: const FileOptions(upsert: true, contentType: 'image/jpeg'),
          );
      remoteImageUrl = client.storage.from('product-images').getPublicUrl(objectPath);
    }

    await client.from('products').upsert({
      'id': product.id,
      'title': product.title,
      'description': product.description,
      'material': product.material,
      'design': product.design,
      'type': product.type,
      'color': product.color,
      'length': product.length,
      'width': product.width,
      'weight': product.weight,
      'craft_technique': product.craftTechnique,
      'category': product.category,
      'keywords': product.keywords,
      'source_language': product.sourceLanguage,
      'material_cost': product.materialCost,
      'labour_cost': product.labourCost,
      'margin': product.margin,
      'recommended_price': product.recommendedPrice,
      'market_median': product.marketMedian,
      'market_factor': product.marketFactor,
      'pricing_confidence': product.pricingConfidence,
      'pricing_rationale': product.pricingRationale,
      'image_url': remoteImageUrl,
      'created_at': product.createdAt.toIso8601String(),
    });
  }

  @override
  Future<List<Product>> fetchProducts() async {
    final client = _client;
    if (client == null) return [];
    final rows = await client.from('products').select().order('created_at', ascending: false);
    return (rows as List).map((row) => _fromRemote(Map<String, dynamic>.from(row))).toList();
  }

  Product _fromRemote(Map<String, dynamic> row) => Product(
        id: row['id'] as String,
        imagePath: row['image_url'] as String? ?? '',
        title: row['title'] as String? ?? '',
        description: row['description'] as String? ?? '',
        material: row['material'] as String? ?? '',
        design: row['design'] as String? ?? '',
        type: row['type'] as String? ?? '',
        color: row['color'] as String? ?? '',
        length: row['length'] as String? ?? '',
        width: row['width'] as String? ?? '',
        weight: row['weight'] as String? ?? '',
        craftTechnique: row['craft_technique'] as String? ?? '',
        category: row['category'] as String? ?? '',
        keywords: row['keywords'] is List ? List<String>.from(row['keywords'] as List) : const [],
        sourceLanguage: row['source_language'] as String? ?? 'en',
        materialCost: (row['material_cost'] as num?)?.toDouble() ?? 0,
        labourCost: (row['labour_cost'] as num?)?.toDouble() ?? 0,
        margin: (row['margin'] as num?)?.toDouble() ?? 20,
        recommendedPrice: (row['recommended_price'] as num?)?.toDouble() ?? 0,
        marketMedian: (row['market_median'] as num?)?.toDouble() ?? 0,
        marketFactor: (row['market_factor'] as num?)?.toDouble() ?? 1,
        pricingConfidence: row['pricing_confidence'] as String? ?? 'medium',
        pricingRationale: row['pricing_rationale'] as String? ?? '',
        synced: true,
        createdAt: DateTime.tryParse(row['created_at'] as String? ?? '') ?? DateTime.now(),
      );
}
