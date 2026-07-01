import 'package:injectable/injectable.dart';

import '../repositories/inventory_repository.dart';

@injectable
class DeleteProductUseCase {
  final InventoryRepository repository;

  DeleteProductUseCase(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteProduct(id);
  }
}
