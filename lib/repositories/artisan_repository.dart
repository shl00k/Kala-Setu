import '../models/artisan.dart';

class ArtisanRepository {
  Artisan? _artisan;
  Future<void> save(Artisan artisan) async => _artisan = artisan;
  Future<Artisan?> get() async => _artisan;
}
