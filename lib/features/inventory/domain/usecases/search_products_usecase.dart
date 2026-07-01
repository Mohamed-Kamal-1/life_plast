import 'package:injectable/injectable.dart';

import '../entities/product_entity.dart';
import '../repositories/inventory_repository.dart';

@injectable
class SearchProductsUseCase {
  final InventoryRepository repository;

  SearchProductsUseCase(this.repository);

  Future<List<ProductEntity>> call(String query) async {
    return await repository.searchProducts(query);
  }
}
