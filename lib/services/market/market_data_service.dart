import '../../models/market_price.dart';

abstract class MarketDataService {
  Future<MarketPrice?> getMarketPrice(String category);
}
