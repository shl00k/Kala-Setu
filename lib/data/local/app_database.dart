import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Products extends Table {
  TextColumn get id => text()();
  TextColumn get originalImagePath => text().withDefault(const Constant(''))();
  TextColumn get imagePath => text().withDefault(const Constant(''))();
  TextColumn get title => text().withDefault(const Constant(''))();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get material => text().withDefault(const Constant(''))();
  TextColumn get design => text().withDefault(const Constant(''))();
  TextColumn get type => text().withDefault(const Constant(''))();
  TextColumn get color => text().withDefault(const Constant(''))();
  TextColumn get length => text().withDefault(const Constant(''))();
  TextColumn get width => text().withDefault(const Constant(''))();
  TextColumn get weight => text().withDefault(const Constant(''))();
  TextColumn get craftTechnique => text().withDefault(const Constant(''))();
  TextColumn get category => text().withDefault(const Constant(''))();
  TextColumn get keywordsJson => text().withDefault(const Constant('[]'))();
  TextColumn get sourceLanguage => text().withDefault(const Constant('en'))();
  RealColumn get materialCost => real().withDefault(const Constant(0))();
  RealColumn get labourCost => real().withDefault(const Constant(0))();
  RealColumn get margin => real().withDefault(const Constant(20))();
  RealColumn get recommendedPrice => real().withDefault(const Constant(0))();
  RealColumn get marketMedian => real().withDefault(const Constant(0))();
  RealColumn get marketFactor => real().withDefault(const Constant(1))();
  TextColumn get pricingConfidence => text().withDefault(const Constant('medium'))();
  TextColumn get pricingRationale => text().withDefault(const Constant(''))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(tables: [Products])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'kaal_setu.sqlite'));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  Future<List<Product>> readProducts() => select(products).get();

  Future<void> upsertProduct(ProductsCompanion row) =>
      into(products).insertOnConflictUpdate(row);

  Future<void> deleteProduct(String id) =>
      (delete(products)..where((t) => t.id.equals(id))).go();
}
