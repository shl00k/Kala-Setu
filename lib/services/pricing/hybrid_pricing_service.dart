import '../../models/pricing.dart';
import 'pricing_service.dart';

class HybridPricingService implements PricingService {
  @override
  Pricing calculate({
    required double materialCost,
    required double labourCost,
    required double marginPercent,
    double? marketMedian,
    int marketSamples = 0,
  }) {
    final cost = materialCost + labourCost;
    final floor = cost * (1 + marginPercent / 100);

    if (marketMedian == null || marketMedian <= 0) {
      return Pricing(
        materialCost: materialCost,
        labourCost: labourCost,
        marginPercent: marginPercent,
        marketFactor: 1,
        recommendedPrice: _round(floor),
        confidence: 'low',
        rationale: 'No market comparable is available. Price is based on material + labour + requested margin.',
      );
    }

    // Keep a cost floor and move toward the market median instead of blindly copying it.
    final target = (floor * 0.55) + (marketMedian * 0.45);
    final minimum = floor;
    final maximum = marketMedian * 1.15;
    final recommended = target.clamp(minimum, maximum).toDouble();
    final factor = recommended / floor;

    return Pricing(
      materialCost: materialCost,
      labourCost: labourCost,
      marginPercent: marginPercent,
      marketFactor: factor,
      marketMedian: marketMedian,
      recommendedPrice: _round(recommended),
      confidence: marketSamples >= 20 ? 'high' : marketSamples >= 5 ? 'medium' : 'low',
      rationale: 'Recommendation blends your cost floor with the observed market median ($marketSamples comparable listings).',
    );
  }

  double _round(double value) => (value / 10).round() * 10.0;
}
