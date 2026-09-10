import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/config/app_config.dart';
import '../../models/market_price.dart';
import 'market_data_service.dart';

class SupabaseMarketDataService implements MarketDataService {
  SupabaseClient? get _client => AppConfig.hasSupabase ? Supabase.instance.client : null;

  @override
  Future<MarketPrice?> getMarketPrice(String category) async {
    final client = _client;
    if (client == null || category.trim().isEmpty) return null;

    final rows = await client
        .from('market_prices')
        .select()
        .ilike('category', category.trim())
        .order('observed_at', ascending: false)
        .limit(1);

    if (rows.isEmpty) return null;
    final row = Map<String, dynamic>.from(rows.first);
    return MarketPrice(
      category: row['category'] as String,
      medianPrice: (row['median_price'] as num).toDouble(),
      minPrice: (row['min_price'] as num).toDouble(),
      maxPrice: (row['max_price'] as num).toDouble(),
      sampleCount: (row['sample_count'] as num).toInt(),
      observedAt: DateTime.tryParse(row['observed_at'] as String? ?? '') ?? DateTime.now(),
    );
  }
}
