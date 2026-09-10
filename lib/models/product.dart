class Product {
  final String id;
  final String originalImagePath;
  final String imagePath;
  final String title;
  final String description;
  final String material;
  final String design;
  final String type;
  final String color;
  final String length;
  final String width;
  final String weight;
  final String craftTechnique;
  final String category;
  final List<String> keywords;
  final String sourceLanguage;
  final double materialCost;
  final double labourCost;
  final double margin;
  final double recommendedPrice;
  final double marketMedian;
  final double marketFactor;
  final String pricingConfidence;
  final String pricingRationale;
  final bool synced;
  final DateTime createdAt;

  const Product({
    required this.id,
    this.originalImagePath = '',
    this.imagePath = '',
    this.title = '',
    this.description = '',
    this.material = '',
    this.design = '',
    this.type = '',
    this.color = '',
    this.length = '',
    this.width = '',
    this.weight = '',
    this.craftTechnique = '',
    this.category = '',
    this.keywords = const [],
    this.sourceLanguage = 'en',
    this.materialCost = 0,
    this.labourCost = 0,
    this.margin = 20,
    this.recommendedPrice = 0,
    this.marketMedian = 0,
    this.marketFactor = 1,
    this.pricingConfidence = 'medium',
    this.pricingRationale = '',
    this.synced = false,
    required this.createdAt,
  });

  Product copyWith({
    String? originalImagePath,
    String? imagePath,
    String? title,
    String? description,
    String? material,
    String? design,
    String? type,
    String? color,
    String? length,
    String? width,
    String? weight,
    String? craftTechnique,
    String? category,
    List<String>? keywords,
    String? sourceLanguage,
    double? materialCost,
    double? labourCost,
    double? margin,
    double? recommendedPrice,
    double? marketMedian,
    double? marketFactor,
    String? pricingConfidence,
    String? pricingRationale,
    bool? synced,
  }) => Product(
        id: id,
        originalImagePath: originalImagePath ?? this.originalImagePath,
        imagePath: imagePath ?? this.imagePath,
        title: title ?? this.title,
        description: description ?? this.description,
        material: material ?? this.material,
        design: design ?? this.design,
        type: type ?? this.type,
        color: color ?? this.color,
        length: length ?? this.length,
        width: width ?? this.width,
        weight: weight ?? this.weight,
        craftTechnique: craftTechnique ?? this.craftTechnique,
        category: category ?? this.category,
        keywords: keywords ?? this.keywords,
        sourceLanguage: sourceLanguage ?? this.sourceLanguage,
        materialCost: materialCost ?? this.materialCost,
        labourCost: labourCost ?? this.labourCost,
        margin: margin ?? this.margin,
        recommendedPrice: recommendedPrice ?? this.recommendedPrice,
        marketMedian: marketMedian ?? this.marketMedian,
        marketFactor: marketFactor ?? this.marketFactor,
        pricingConfidence: pricingConfidence ?? this.pricingConfidence,
        pricingRationale: pricingRationale ?? this.pricingRationale,
        synced: synced ?? this.synced,
        createdAt: createdAt,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'originalImagePath': originalImagePath,
        'imagePath': imagePath,
        'title': title,
        'description': description,
        'material': material,
        'design': design,
        'type': type,
        'color': color,
        'length': length,
        'width': width,
        'weight': weight,
        'craftTechnique': craftTechnique,
        'category': category,
        'keywords': keywords,
        'sourceLanguage': sourceLanguage,
        'materialCost': materialCost,
        'labourCost': labourCost,
        'margin': margin,
        'recommendedPrice': recommendedPrice,
        'marketMedian': marketMedian,
        'marketFactor': marketFactor,
        'pricingConfidence': pricingConfidence,
        'pricingRationale': pricingRationale,
        'synced': synced,
        'createdAt': createdAt.toIso8601String(),
      };

  factory Product.fromMap(Map<String, dynamic> map) => Product(
        id: map['id'] as String,
        originalImagePath: map['originalImagePath'] as String? ?? '',
        imagePath: map['imagePath'] as String? ?? '',
        title: map['title'] as String? ?? '',
        description: map['description'] as String? ?? '',
        material: map['material'] as String? ?? '',
        design: map['design'] as String? ?? '',
        type: map['type'] as String? ?? '',
        color: map['color'] as String? ?? '',
        length: map['length'] as String? ?? '',
        width: map['width'] as String? ?? '',
        weight: map['weight'] as String? ?? '',
        craftTechnique: map['craftTechnique'] as String? ?? '',
        category: map['category'] as String? ?? '',
        keywords: (map['keywords'] is List)
            ? List<String>.from(map['keywords'] as List)
            : const [],
        sourceLanguage: map['sourceLanguage'] as String? ?? 'en',
        materialCost: (map['materialCost'] as num?)?.toDouble() ?? 0,
        labourCost: (map['labourCost'] as num?)?.toDouble() ?? 0,
        margin: (map['margin'] as num?)?.toDouble() ?? 20,
        recommendedPrice:
            (map['recommendedPrice'] as num?)?.toDouble() ?? 0,
        marketMedian: (map['marketMedian'] as num?)?.toDouble() ?? 0,
        marketFactor: (map['marketFactor'] as num?)?.toDouble() ?? 1,
        pricingConfidence: map['pricingConfidence'] as String? ?? 'medium',
        pricingRationale: map['pricingRationale'] as String? ?? '',
        synced: map['synced'] == true,
        createdAt: DateTime.tryParse(map['createdAt'] as String? ?? '') ??
            DateTime.now(),
      );
}
