// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalImagePathMeta = const VerificationMeta(
    'originalImagePath',
  );
  @override
  late final GeneratedColumn<String> originalImagePath =
      GeneratedColumn<String>(
        'original_image_path',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _materialMeta = const VerificationMeta(
    'material',
  );
  @override
  late final GeneratedColumn<String> material = GeneratedColumn<String>(
    'material',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _designMeta = const VerificationMeta('design');
  @override
  late final GeneratedColumn<String> design = GeneratedColumn<String>(
    'design',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<String> length = GeneratedColumn<String>(
    'length',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<String> width = GeneratedColumn<String>(
    'width',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<String> weight = GeneratedColumn<String>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _craftTechniqueMeta = const VerificationMeta(
    'craftTechnique',
  );
  @override
  late final GeneratedColumn<String> craftTechnique = GeneratedColumn<String>(
    'craft_technique',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _keywordsJsonMeta = const VerificationMeta(
    'keywordsJson',
  );
  @override
  late final GeneratedColumn<String> keywordsJson = GeneratedColumn<String>(
    'keywords_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _sourceLanguageMeta = const VerificationMeta(
    'sourceLanguage',
  );
  @override
  late final GeneratedColumn<String> sourceLanguage = GeneratedColumn<String>(
    'source_language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('en'),
  );
  static const VerificationMeta _materialCostMeta = const VerificationMeta(
    'materialCost',
  );
  @override
  late final GeneratedColumn<double> materialCost = GeneratedColumn<double>(
    'material_cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _labourCostMeta = const VerificationMeta(
    'labourCost',
  );
  @override
  late final GeneratedColumn<double> labourCost = GeneratedColumn<double>(
    'labour_cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _marginMeta = const VerificationMeta('margin');
  @override
  late final GeneratedColumn<double> margin = GeneratedColumn<double>(
    'margin',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(20),
  );
  static const VerificationMeta _recommendedPriceMeta = const VerificationMeta(
    'recommendedPrice',
  );
  @override
  late final GeneratedColumn<double> recommendedPrice = GeneratedColumn<double>(
    'recommended_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _marketMedianMeta = const VerificationMeta(
    'marketMedian',
  );
  @override
  late final GeneratedColumn<double> marketMedian = GeneratedColumn<double>(
    'market_median',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _marketFactorMeta = const VerificationMeta(
    'marketFactor',
  );
  @override
  late final GeneratedColumn<double> marketFactor = GeneratedColumn<double>(
    'market_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _pricingConfidenceMeta = const VerificationMeta(
    'pricingConfidence',
  );
  @override
  late final GeneratedColumn<String> pricingConfidence =
      GeneratedColumn<String>(
        'pricing_confidence',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('medium'),
      );
  static const VerificationMeta _pricingRationaleMeta = const VerificationMeta(
    'pricingRationale',
  );
  @override
  late final GeneratedColumn<String> pricingRationale = GeneratedColumn<String>(
    'pricing_rationale',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
    'synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    originalImagePath,
    imagePath,
    title,
    description,
    material,
    design,
    type,
    color,
    length,
    width,
    weight,
    craftTechnique,
    category,
    keywordsJson,
    sourceLanguage,
    materialCost,
    labourCost,
    margin,
    recommendedPrice,
    marketMedian,
    marketFactor,
    pricingConfidence,
    pricingRationale,
    synced,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('original_image_path')) {
      context.handle(
        _originalImagePathMeta,
        originalImagePath.isAcceptableOrUnknown(
          data['original_image_path']!,
          _originalImagePathMeta,
        ),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('material')) {
      context.handle(
        _materialMeta,
        material.isAcceptableOrUnknown(data['material']!, _materialMeta),
      );
    }
    if (data.containsKey('design')) {
      context.handle(
        _designMeta,
        design.isAcceptableOrUnknown(data['design']!, _designMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('length')) {
      context.handle(
        _lengthMeta,
        length.isAcceptableOrUnknown(data['length']!, _lengthMeta),
      );
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('craft_technique')) {
      context.handle(
        _craftTechniqueMeta,
        craftTechnique.isAcceptableOrUnknown(
          data['craft_technique']!,
          _craftTechniqueMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('keywords_json')) {
      context.handle(
        _keywordsJsonMeta,
        keywordsJson.isAcceptableOrUnknown(
          data['keywords_json']!,
          _keywordsJsonMeta,
        ),
      );
    }
    if (data.containsKey('source_language')) {
      context.handle(
        _sourceLanguageMeta,
        sourceLanguage.isAcceptableOrUnknown(
          data['source_language']!,
          _sourceLanguageMeta,
        ),
      );
    }
    if (data.containsKey('material_cost')) {
      context.handle(
        _materialCostMeta,
        materialCost.isAcceptableOrUnknown(
          data['material_cost']!,
          _materialCostMeta,
        ),
      );
    }
    if (data.containsKey('labour_cost')) {
      context.handle(
        _labourCostMeta,
        labourCost.isAcceptableOrUnknown(data['labour_cost']!, _labourCostMeta),
      );
    }
    if (data.containsKey('margin')) {
      context.handle(
        _marginMeta,
        margin.isAcceptableOrUnknown(data['margin']!, _marginMeta),
      );
    }
    if (data.containsKey('recommended_price')) {
      context.handle(
        _recommendedPriceMeta,
        recommendedPrice.isAcceptableOrUnknown(
          data['recommended_price']!,
          _recommendedPriceMeta,
        ),
      );
    }
    if (data.containsKey('market_median')) {
      context.handle(
        _marketMedianMeta,
        marketMedian.isAcceptableOrUnknown(
          data['market_median']!,
          _marketMedianMeta,
        ),
      );
    }
    if (data.containsKey('market_factor')) {
      context.handle(
        _marketFactorMeta,
        marketFactor.isAcceptableOrUnknown(
          data['market_factor']!,
          _marketFactorMeta,
        ),
      );
    }
    if (data.containsKey('pricing_confidence')) {
      context.handle(
        _pricingConfidenceMeta,
        pricingConfidence.isAcceptableOrUnknown(
          data['pricing_confidence']!,
          _pricingConfidenceMeta,
        ),
      );
    }
    if (data.containsKey('pricing_rationale')) {
      context.handle(
        _pricingRationaleMeta,
        pricingRationale.isAcceptableOrUnknown(
          data['pricing_rationale']!,
          _pricingRationaleMeta,
        ),
      );
    }
    if (data.containsKey('synced')) {
      context.handle(
        _syncedMeta,
        synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      originalImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_image_path'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      material: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material'],
      )!,
      design: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}design'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      )!,
      length: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}length'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}width'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weight'],
      )!,
      craftTechnique: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}craft_technique'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      keywordsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}keywords_json'],
      )!,
      sourceLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_language'],
      )!,
      materialCost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}material_cost'],
      )!,
      labourCost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}labour_cost'],
      )!,
      margin: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}margin'],
      )!,
      recommendedPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}recommended_price'],
      )!,
      marketMedian: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}market_median'],
      )!,
      marketFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}market_factor'],
      )!,
      pricingConfidence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pricing_confidence'],
      )!,
      pricingRationale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pricing_rationale'],
      )!,
      synced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
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
  final String keywordsJson;
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
    required this.originalImagePath,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.material,
    required this.design,
    required this.type,
    required this.color,
    required this.length,
    required this.width,
    required this.weight,
    required this.craftTechnique,
    required this.category,
    required this.keywordsJson,
    required this.sourceLanguage,
    required this.materialCost,
    required this.labourCost,
    required this.margin,
    required this.recommendedPrice,
    required this.marketMedian,
    required this.marketFactor,
    required this.pricingConfidence,
    required this.pricingRationale,
    required this.synced,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['original_image_path'] = Variable<String>(originalImagePath);
    map['image_path'] = Variable<String>(imagePath);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['material'] = Variable<String>(material);
    map['design'] = Variable<String>(design);
    map['type'] = Variable<String>(type);
    map['color'] = Variable<String>(color);
    map['length'] = Variable<String>(length);
    map['width'] = Variable<String>(width);
    map['weight'] = Variable<String>(weight);
    map['craft_technique'] = Variable<String>(craftTechnique);
    map['category'] = Variable<String>(category);
    map['keywords_json'] = Variable<String>(keywordsJson);
    map['source_language'] = Variable<String>(sourceLanguage);
    map['material_cost'] = Variable<double>(materialCost);
    map['labour_cost'] = Variable<double>(labourCost);
    map['margin'] = Variable<double>(margin);
    map['recommended_price'] = Variable<double>(recommendedPrice);
    map['market_median'] = Variable<double>(marketMedian);
    map['market_factor'] = Variable<double>(marketFactor);
    map['pricing_confidence'] = Variable<String>(pricingConfidence);
    map['pricing_rationale'] = Variable<String>(pricingRationale);
    map['synced'] = Variable<bool>(synced);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      originalImagePath: Value(originalImagePath),
      imagePath: Value(imagePath),
      title: Value(title),
      description: Value(description),
      material: Value(material),
      design: Value(design),
      type: Value(type),
      color: Value(color),
      length: Value(length),
      width: Value(width),
      weight: Value(weight),
      craftTechnique: Value(craftTechnique),
      category: Value(category),
      keywordsJson: Value(keywordsJson),
      sourceLanguage: Value(sourceLanguage),
      materialCost: Value(materialCost),
      labourCost: Value(labourCost),
      margin: Value(margin),
      recommendedPrice: Value(recommendedPrice),
      marketMedian: Value(marketMedian),
      marketFactor: Value(marketFactor),
      pricingConfidence: Value(pricingConfidence),
      pricingRationale: Value(pricingRationale),
      synced: Value(synced),
      createdAt: Value(createdAt),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      originalImagePath: serializer.fromJson<String>(json['originalImagePath']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      material: serializer.fromJson<String>(json['material']),
      design: serializer.fromJson<String>(json['design']),
      type: serializer.fromJson<String>(json['type']),
      color: serializer.fromJson<String>(json['color']),
      length: serializer.fromJson<String>(json['length']),
      width: serializer.fromJson<String>(json['width']),
      weight: serializer.fromJson<String>(json['weight']),
      craftTechnique: serializer.fromJson<String>(json['craftTechnique']),
      category: serializer.fromJson<String>(json['category']),
      keywordsJson: serializer.fromJson<String>(json['keywordsJson']),
      sourceLanguage: serializer.fromJson<String>(json['sourceLanguage']),
      materialCost: serializer.fromJson<double>(json['materialCost']),
      labourCost: serializer.fromJson<double>(json['labourCost']),
      margin: serializer.fromJson<double>(json['margin']),
      recommendedPrice: serializer.fromJson<double>(json['recommendedPrice']),
      marketMedian: serializer.fromJson<double>(json['marketMedian']),
      marketFactor: serializer.fromJson<double>(json['marketFactor']),
      pricingConfidence: serializer.fromJson<String>(json['pricingConfidence']),
      pricingRationale: serializer.fromJson<String>(json['pricingRationale']),
      synced: serializer.fromJson<bool>(json['synced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'originalImagePath': serializer.toJson<String>(originalImagePath),
      'imagePath': serializer.toJson<String>(imagePath),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'material': serializer.toJson<String>(material),
      'design': serializer.toJson<String>(design),
      'type': serializer.toJson<String>(type),
      'color': serializer.toJson<String>(color),
      'length': serializer.toJson<String>(length),
      'width': serializer.toJson<String>(width),
      'weight': serializer.toJson<String>(weight),
      'craftTechnique': serializer.toJson<String>(craftTechnique),
      'category': serializer.toJson<String>(category),
      'keywordsJson': serializer.toJson<String>(keywordsJson),
      'sourceLanguage': serializer.toJson<String>(sourceLanguage),
      'materialCost': serializer.toJson<double>(materialCost),
      'labourCost': serializer.toJson<double>(labourCost),
      'margin': serializer.toJson<double>(margin),
      'recommendedPrice': serializer.toJson<double>(recommendedPrice),
      'marketMedian': serializer.toJson<double>(marketMedian),
      'marketFactor': serializer.toJson<double>(marketFactor),
      'pricingConfidence': serializer.toJson<String>(pricingConfidence),
      'pricingRationale': serializer.toJson<String>(pricingRationale),
      'synced': serializer.toJson<bool>(synced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Product copyWith({
    String? id,
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
    String? keywordsJson,
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
    DateTime? createdAt,
  }) => Product(
    id: id ?? this.id,
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
    keywordsJson: keywordsJson ?? this.keywordsJson,
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
    createdAt: createdAt ?? this.createdAt,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      originalImagePath: data.originalImagePath.present
          ? data.originalImagePath.value
          : this.originalImagePath,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      material: data.material.present ? data.material.value : this.material,
      design: data.design.present ? data.design.value : this.design,
      type: data.type.present ? data.type.value : this.type,
      color: data.color.present ? data.color.value : this.color,
      length: data.length.present ? data.length.value : this.length,
      width: data.width.present ? data.width.value : this.width,
      weight: data.weight.present ? data.weight.value : this.weight,
      craftTechnique: data.craftTechnique.present
          ? data.craftTechnique.value
          : this.craftTechnique,
      category: data.category.present ? data.category.value : this.category,
      keywordsJson: data.keywordsJson.present
          ? data.keywordsJson.value
          : this.keywordsJson,
      sourceLanguage: data.sourceLanguage.present
          ? data.sourceLanguage.value
          : this.sourceLanguage,
      materialCost: data.materialCost.present
          ? data.materialCost.value
          : this.materialCost,
      labourCost: data.labourCost.present
          ? data.labourCost.value
          : this.labourCost,
      margin: data.margin.present ? data.margin.value : this.margin,
      recommendedPrice: data.recommendedPrice.present
          ? data.recommendedPrice.value
          : this.recommendedPrice,
      marketMedian: data.marketMedian.present
          ? data.marketMedian.value
          : this.marketMedian,
      marketFactor: data.marketFactor.present
          ? data.marketFactor.value
          : this.marketFactor,
      pricingConfidence: data.pricingConfidence.present
          ? data.pricingConfidence.value
          : this.pricingConfidence,
      pricingRationale: data.pricingRationale.present
          ? data.pricingRationale.value
          : this.pricingRationale,
      synced: data.synced.present ? data.synced.value : this.synced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('originalImagePath: $originalImagePath, ')
          ..write('imagePath: $imagePath, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('material: $material, ')
          ..write('design: $design, ')
          ..write('type: $type, ')
          ..write('color: $color, ')
          ..write('length: $length, ')
          ..write('width: $width, ')
          ..write('weight: $weight, ')
          ..write('craftTechnique: $craftTechnique, ')
          ..write('category: $category, ')
          ..write('keywordsJson: $keywordsJson, ')
          ..write('sourceLanguage: $sourceLanguage, ')
          ..write('materialCost: $materialCost, ')
          ..write('labourCost: $labourCost, ')
          ..write('margin: $margin, ')
          ..write('recommendedPrice: $recommendedPrice, ')
          ..write('marketMedian: $marketMedian, ')
          ..write('marketFactor: $marketFactor, ')
          ..write('pricingConfidence: $pricingConfidence, ')
          ..write('pricingRationale: $pricingRationale, ')
          ..write('synced: $synced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    originalImagePath,
    imagePath,
    title,
    description,
    material,
    design,
    type,
    color,
    length,
    width,
    weight,
    craftTechnique,
    category,
    keywordsJson,
    sourceLanguage,
    materialCost,
    labourCost,
    margin,
    recommendedPrice,
    marketMedian,
    marketFactor,
    pricingConfidence,
    pricingRationale,
    synced,
    createdAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.originalImagePath == this.originalImagePath &&
          other.imagePath == this.imagePath &&
          other.title == this.title &&
          other.description == this.description &&
          other.material == this.material &&
          other.design == this.design &&
          other.type == this.type &&
          other.color == this.color &&
          other.length == this.length &&
          other.width == this.width &&
          other.weight == this.weight &&
          other.craftTechnique == this.craftTechnique &&
          other.category == this.category &&
          other.keywordsJson == this.keywordsJson &&
          other.sourceLanguage == this.sourceLanguage &&
          other.materialCost == this.materialCost &&
          other.labourCost == this.labourCost &&
          other.margin == this.margin &&
          other.recommendedPrice == this.recommendedPrice &&
          other.marketMedian == this.marketMedian &&
          other.marketFactor == this.marketFactor &&
          other.pricingConfidence == this.pricingConfidence &&
          other.pricingRationale == this.pricingRationale &&
          other.synced == this.synced &&
          other.createdAt == this.createdAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String> originalImagePath;
  final Value<String> imagePath;
  final Value<String> title;
  final Value<String> description;
  final Value<String> material;
  final Value<String> design;
  final Value<String> type;
  final Value<String> color;
  final Value<String> length;
  final Value<String> width;
  final Value<String> weight;
  final Value<String> craftTechnique;
  final Value<String> category;
  final Value<String> keywordsJson;
  final Value<String> sourceLanguage;
  final Value<double> materialCost;
  final Value<double> labourCost;
  final Value<double> margin;
  final Value<double> recommendedPrice;
  final Value<double> marketMedian;
  final Value<double> marketFactor;
  final Value<String> pricingConfidence;
  final Value<String> pricingRationale;
  final Value<bool> synced;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.originalImagePath = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.material = const Value.absent(),
    this.design = const Value.absent(),
    this.type = const Value.absent(),
    this.color = const Value.absent(),
    this.length = const Value.absent(),
    this.width = const Value.absent(),
    this.weight = const Value.absent(),
    this.craftTechnique = const Value.absent(),
    this.category = const Value.absent(),
    this.keywordsJson = const Value.absent(),
    this.sourceLanguage = const Value.absent(),
    this.materialCost = const Value.absent(),
    this.labourCost = const Value.absent(),
    this.margin = const Value.absent(),
    this.recommendedPrice = const Value.absent(),
    this.marketMedian = const Value.absent(),
    this.marketFactor = const Value.absent(),
    this.pricingConfidence = const Value.absent(),
    this.pricingRationale = const Value.absent(),
    this.synced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    this.originalImagePath = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.material = const Value.absent(),
    this.design = const Value.absent(),
    this.type = const Value.absent(),
    this.color = const Value.absent(),
    this.length = const Value.absent(),
    this.width = const Value.absent(),
    this.weight = const Value.absent(),
    this.craftTechnique = const Value.absent(),
    this.category = const Value.absent(),
    this.keywordsJson = const Value.absent(),
    this.sourceLanguage = const Value.absent(),
    this.materialCost = const Value.absent(),
    this.labourCost = const Value.absent(),
    this.margin = const Value.absent(),
    this.recommendedPrice = const Value.absent(),
    this.marketMedian = const Value.absent(),
    this.marketFactor = const Value.absent(),
    this.pricingConfidence = const Value.absent(),
    this.pricingRationale = const Value.absent(),
    this.synced = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? originalImagePath,
    Expression<String>? imagePath,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? material,
    Expression<String>? design,
    Expression<String>? type,
    Expression<String>? color,
    Expression<String>? length,
    Expression<String>? width,
    Expression<String>? weight,
    Expression<String>? craftTechnique,
    Expression<String>? category,
    Expression<String>? keywordsJson,
    Expression<String>? sourceLanguage,
    Expression<double>? materialCost,
    Expression<double>? labourCost,
    Expression<double>? margin,
    Expression<double>? recommendedPrice,
    Expression<double>? marketMedian,
    Expression<double>? marketFactor,
    Expression<String>? pricingConfidence,
    Expression<String>? pricingRationale,
    Expression<bool>? synced,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (originalImagePath != null) 'original_image_path': originalImagePath,
      if (imagePath != null) 'image_path': imagePath,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (material != null) 'material': material,
      if (design != null) 'design': design,
      if (type != null) 'type': type,
      if (color != null) 'color': color,
      if (length != null) 'length': length,
      if (width != null) 'width': width,
      if (weight != null) 'weight': weight,
      if (craftTechnique != null) 'craft_technique': craftTechnique,
      if (category != null) 'category': category,
      if (keywordsJson != null) 'keywords_json': keywordsJson,
      if (sourceLanguage != null) 'source_language': sourceLanguage,
      if (materialCost != null) 'material_cost': materialCost,
      if (labourCost != null) 'labour_cost': labourCost,
      if (margin != null) 'margin': margin,
      if (recommendedPrice != null) 'recommended_price': recommendedPrice,
      if (marketMedian != null) 'market_median': marketMedian,
      if (marketFactor != null) 'market_factor': marketFactor,
      if (pricingConfidence != null) 'pricing_confidence': pricingConfidence,
      if (pricingRationale != null) 'pricing_rationale': pricingRationale,
      if (synced != null) 'synced': synced,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<String>? originalImagePath,
    Value<String>? imagePath,
    Value<String>? title,
    Value<String>? description,
    Value<String>? material,
    Value<String>? design,
    Value<String>? type,
    Value<String>? color,
    Value<String>? length,
    Value<String>? width,
    Value<String>? weight,
    Value<String>? craftTechnique,
    Value<String>? category,
    Value<String>? keywordsJson,
    Value<String>? sourceLanguage,
    Value<double>? materialCost,
    Value<double>? labourCost,
    Value<double>? margin,
    Value<double>? recommendedPrice,
    Value<double>? marketMedian,
    Value<double>? marketFactor,
    Value<String>? pricingConfidence,
    Value<String>? pricingRationale,
    Value<bool>? synced,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
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
      keywordsJson: keywordsJson ?? this.keywordsJson,
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
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (originalImagePath.present) {
      map['original_image_path'] = Variable<String>(originalImagePath.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (material.present) {
      map['material'] = Variable<String>(material.value);
    }
    if (design.present) {
      map['design'] = Variable<String>(design.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (length.present) {
      map['length'] = Variable<String>(length.value);
    }
    if (width.present) {
      map['width'] = Variable<String>(width.value);
    }
    if (weight.present) {
      map['weight'] = Variable<String>(weight.value);
    }
    if (craftTechnique.present) {
      map['craft_technique'] = Variable<String>(craftTechnique.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (keywordsJson.present) {
      map['keywords_json'] = Variable<String>(keywordsJson.value);
    }
    if (sourceLanguage.present) {
      map['source_language'] = Variable<String>(sourceLanguage.value);
    }
    if (materialCost.present) {
      map['material_cost'] = Variable<double>(materialCost.value);
    }
    if (labourCost.present) {
      map['labour_cost'] = Variable<double>(labourCost.value);
    }
    if (margin.present) {
      map['margin'] = Variable<double>(margin.value);
    }
    if (recommendedPrice.present) {
      map['recommended_price'] = Variable<double>(recommendedPrice.value);
    }
    if (marketMedian.present) {
      map['market_median'] = Variable<double>(marketMedian.value);
    }
    if (marketFactor.present) {
      map['market_factor'] = Variable<double>(marketFactor.value);
    }
    if (pricingConfidence.present) {
      map['pricing_confidence'] = Variable<String>(pricingConfidence.value);
    }
    if (pricingRationale.present) {
      map['pricing_rationale'] = Variable<String>(pricingRationale.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('originalImagePath: $originalImagePath, ')
          ..write('imagePath: $imagePath, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('material: $material, ')
          ..write('design: $design, ')
          ..write('type: $type, ')
          ..write('color: $color, ')
          ..write('length: $length, ')
          ..write('width: $width, ')
          ..write('weight: $weight, ')
          ..write('craftTechnique: $craftTechnique, ')
          ..write('category: $category, ')
          ..write('keywordsJson: $keywordsJson, ')
          ..write('sourceLanguage: $sourceLanguage, ')
          ..write('materialCost: $materialCost, ')
          ..write('labourCost: $labourCost, ')
          ..write('margin: $margin, ')
          ..write('recommendedPrice: $recommendedPrice, ')
          ..write('marketMedian: $marketMedian, ')
          ..write('marketFactor: $marketFactor, ')
          ..write('pricingConfidence: $pricingConfidence, ')
          ..write('pricingRationale: $pricingRationale, ')
          ..write('synced: $synced, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [products];
}

typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  required String id,
  Value<String> originalImagePath,
  Value<String> imagePath,
  Value<String> title,
  Value<String> description,
  Value<String> material,
  Value<String> design,
  Value<String> type,
  Value<String> color,
  Value<String> length,
  Value<String> width,
  Value<String> weight,
  Value<String> craftTechnique,
  Value<String> category,
  Value<String> keywordsJson,
  Value<String> sourceLanguage,
  Value<double> materialCost,
  Value<double> labourCost,
  Value<double> margin,
  Value<double> recommendedPrice,
  Value<double> marketMedian,
  Value<double> marketFactor,
  Value<String> pricingConfidence,
  Value<String> pricingRationale,
  Value<bool> synced,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<String> id,
  Value<String> originalImagePath,
  Value<String> imagePath,
  Value<String> title,
  Value<String> description,
  Value<String> material,
  Value<String> design,
  Value<String> type,
  Value<String> color,
  Value<String> length,
  Value<String> width,
  Value<String> weight,
  Value<String> craftTechnique,
  Value<String> category,
  Value<String> keywordsJson,
  Value<String> sourceLanguage,
  Value<double> materialCost,
  Value<double> labourCost,
  Value<double> margin,
  Value<double> recommendedPrice,
  Value<double> marketMedian,
  Value<double> marketFactor,
  Value<String> pricingConfidence,
  Value<String> pricingRationale,
  Value<bool> synced,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalImagePath => $composableBuilder(
    column: $table.originalImagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get design => $composableBuilder(
    column: $table.design,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get length => $composableBuilder(
    column: $table.length,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get craftTechnique => $composableBuilder(
    column: $table.craftTechnique,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keywordsJson => $composableBuilder(
    column: $table.keywordsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceLanguage => $composableBuilder(
    column: $table.sourceLanguage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get materialCost => $composableBuilder(
    column: $table.materialCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get labourCost => $composableBuilder(
    column: $table.labourCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get margin => $composableBuilder(
    column: $table.margin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get recommendedPrice => $composableBuilder(
    column: $table.recommendedPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get marketMedian => $composableBuilder(
    column: $table.marketMedian,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get marketFactor => $composableBuilder(
    column: $table.marketFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pricingConfidence => $composableBuilder(
    column: $table.pricingConfidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pricingRationale => $composableBuilder(
    column: $table.pricingRationale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get synced => $composableBuilder(
    column: $table.synced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalImagePath => $composableBuilder(
    column: $table.originalImagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get design => $composableBuilder(
    column: $table.design,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get length => $composableBuilder(
    column: $table.length,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get craftTechnique => $composableBuilder(
    column: $table.craftTechnique,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keywordsJson => $composableBuilder(
    column: $table.keywordsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceLanguage => $composableBuilder(
    column: $table.sourceLanguage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get materialCost => $composableBuilder(
    column: $table.materialCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get labourCost => $composableBuilder(
    column: $table.labourCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get margin => $composableBuilder(
    column: $table.margin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get recommendedPrice => $composableBuilder(
    column: $table.recommendedPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get marketMedian => $composableBuilder(
    column: $table.marketMedian,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get marketFactor => $composableBuilder(
    column: $table.marketFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pricingConfidence => $composableBuilder(
    column: $table.pricingConfidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pricingRationale => $composableBuilder(
    column: $table.pricingRationale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get synced => $composableBuilder(
    column: $table.synced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get originalImagePath => $composableBuilder(
    column: $table.originalImagePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get material =>
      $composableBuilder(column: $table.material, builder: (column) => column);

  GeneratedColumn<String> get design =>
      $composableBuilder(column: $table.design, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get length =>
      $composableBuilder(column: $table.length, builder: (column) => column);

  GeneratedColumn<String> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<String> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get craftTechnique => $composableBuilder(
    column: $table.craftTechnique,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get keywordsJson => $composableBuilder(
    column: $table.keywordsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceLanguage => $composableBuilder(
    column: $table.sourceLanguage,
    builder: (column) => column,
  );

  GeneratedColumn<double> get materialCost => $composableBuilder(
    column: $table.materialCost,
    builder: (column) => column,
  );

  GeneratedColumn<double> get labourCost => $composableBuilder(
    column: $table.labourCost,
    builder: (column) => column,
  );

  GeneratedColumn<double> get margin =>
      $composableBuilder(column: $table.margin, builder: (column) => column);

  GeneratedColumn<double> get recommendedPrice => $composableBuilder(
    column: $table.recommendedPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get marketMedian => $composableBuilder(
    column: $table.marketMedian,
    builder: (column) => column,
  );

  GeneratedColumn<double> get marketFactor => $composableBuilder(
    column: $table.marketFactor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pricingConfidence => $composableBuilder(
    column: $table.pricingConfidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pricingRationale => $composableBuilder(
    column: $table.pricingRationale,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> originalImagePath = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> material = const Value.absent(),
                Value<String> design = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<String> length = const Value.absent(),
                Value<String> width = const Value.absent(),
                Value<String> weight = const Value.absent(),
                Value<String> craftTechnique = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> keywordsJson = const Value.absent(),
                Value<String> sourceLanguage = const Value.absent(),
                Value<double> materialCost = const Value.absent(),
                Value<double> labourCost = const Value.absent(),
                Value<double> margin = const Value.absent(),
                Value<double> recommendedPrice = const Value.absent(),
                Value<double> marketMedian = const Value.absent(),
                Value<double> marketFactor = const Value.absent(),
                Value<String> pricingConfidence = const Value.absent(),
                Value<String> pricingRationale = const Value.absent(),
                Value<bool> synced = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                originalImagePath: originalImagePath,
                imagePath: imagePath,
                title: title,
                description: description,
                material: material,
                design: design,
                type: type,
                color: color,
                length: length,
                width: width,
                weight: weight,
                craftTechnique: craftTechnique,
                category: category,
                keywordsJson: keywordsJson,
                sourceLanguage: sourceLanguage,
                materialCost: materialCost,
                labourCost: labourCost,
                margin: margin,
                recommendedPrice: recommendedPrice,
                marketMedian: marketMedian,
                marketFactor: marketFactor,
                pricingConfidence: pricingConfidence,
                pricingRationale: pricingRationale,
                synced: synced,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> originalImagePath = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> material = const Value.absent(),
                Value<String> design = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<String> length = const Value.absent(),
                Value<String> width = const Value.absent(),
                Value<String> weight = const Value.absent(),
                Value<String> craftTechnique = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> keywordsJson = const Value.absent(),
                Value<String> sourceLanguage = const Value.absent(),
                Value<double> materialCost = const Value.absent(),
                Value<double> labourCost = const Value.absent(),
                Value<double> margin = const Value.absent(),
                Value<double> recommendedPrice = const Value.absent(),
                Value<double> marketMedian = const Value.absent(),
                Value<double> marketFactor = const Value.absent(),
                Value<String> pricingConfidence = const Value.absent(),
                Value<String> pricingRationale = const Value.absent(),
                Value<bool> synced = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                originalImagePath: originalImagePath,
                imagePath: imagePath,
                title: title,
                description: description,
                material: material,
                design: design,
                type: type,
                color: color,
                length: length,
                width: width,
                weight: weight,
                craftTechnique: craftTechnique,
                category: category,
                keywordsJson: keywordsJson,
                sourceLanguage: sourceLanguage,
                materialCost: materialCost,
                labourCost: labourCost,
                margin: margin,
                recommendedPrice: recommendedPrice,
                marketMedian: marketMedian,
                marketFactor: marketFactor,
                pricingConfidence: pricingConfidence,
                pricingRationale: pricingRationale,
                synced: synced,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductsTable, Product>(table),
                  BaseReferences<_$AppDatabase, $ProductsTable, Product>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
      Product,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
}
