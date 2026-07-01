import 'package:injectable/injectable.dart';

import '../entities/product_entity.dart';
import '../repositories/inventory_repository.dart';

@injectable
class GetProductsUseCase {
  final InventoryRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.getProducts();
  }
}
