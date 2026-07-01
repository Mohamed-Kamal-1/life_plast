import '../../domain/entities/product_entity.dart';

abstract class InventoryState {
  const InventoryState();
}

class InventoryInitial extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventoryLoaded extends InventoryState {
  final List<ProductEntity> products;
  const InventoryLoaded(this.products);
}

class InventoryError extends InventoryState {
  final String message;
  const InventoryError(this.message);
}
