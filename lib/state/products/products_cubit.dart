import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product.dart';
import '../../repositories/product_repository.dart';

class ProductsCubit extends Cubit<List<Product>> {
  final ProductRepository repository;
  ProductsCubit(this.repository) : super(const []);

  Future<void> load() async {
    emit(await repository.getAll());
  }

  Future<void> delete(String id) async {
    await repository.delete(id);
    emit(state.where((product) => product.id != id).toList(growable: false));
  }

  Future<void> sync() async {
    await repository.syncAll();
    await load();
  }
}
