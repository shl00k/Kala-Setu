import '../../models/pricing.dart';

abstract class PricingService {
  Pricing calculate({
    required double materialCost,
    required double labourCost,
    required double marginPercent,
    double? marketMedian,
    int marketSamples = 0,
  });
}
