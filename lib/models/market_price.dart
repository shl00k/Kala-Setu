class MarketPrice {
  final String category;
  final double medianPrice;
  final double minPrice;
  final double maxPrice;
  final int sampleCount;
  final DateTime observedAt;

  const MarketPrice({
    required this.category,
    required this.medianPrice,
    required this.minPrice,
    required this.maxPrice,
    required this.sampleCount,
    required this.observedAt,
  });
}
