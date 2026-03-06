import '../../../data/models/product_model.dart';


abstract class InventoryState {}

class InventoryInitial extends InventoryState {}

class InventoryErrorState extends InventoryState {
  String error;

  InventoryErrorState({required this.error});
}

class InventoryDataState extends InventoryState {
  final List<ProductModel> inventoryProducts;

  InventoryDataState({
    required this.inventoryProducts,
  });
}