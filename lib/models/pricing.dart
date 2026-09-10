class Pricing {
  final double materialCost;
  final double labourCost;
  final double marginPercent;
  final double marketFactor;
  final double recommendedPrice;
  final double marketMedian;
  final String confidence;
  final String rationale;

  const Pricing({
    required this.materialCost,
    required this.labourCost,
    required this.marginPercent,
    required this.marketFactor,
    required this.recommendedPrice,
    this.marketMedian = 0,
    this.confidence = 'medium',
    this.rationale = '',
  });

  Map<String, dynamic> toMap() => {
        'materialCost': materialCost,
        'labourCost': labourCost,
        'marginPercent': marginPercent,
        'marketFactor': marketFactor,
        'recommendedPrice': recommendedPrice,
        'marketMedian': marketMedian,
        'confidence': confidence,
        'rationale': rationale,
      };
}
