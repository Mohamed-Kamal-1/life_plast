import 'package:injectable/injectable.dart';

import '../entities/product_entity.dart';
import '../repositories/inventory_repository.dart';

@injectable
class AddProductUseCase {
  final InventoryRepository repository;

  AddProductUseCase(this.repository);

  Future<void> call(ProductEntity product) async {
    return await repository.addProduct(product);
  }
}
