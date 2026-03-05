import '../../../data/models/product_model.dart';


abstract class InventoryState {}

class InventoryInitial extends InventoryState {}

class InventoryDataState extends InventoryState {
  // قائمة كل الأصناف في المخزن
  final List<ProductModel> inventoryProducts;
  // قائمة الأصناف داخل الفاتورة الحالية فقط
  final List<ProductModel> invoiceItems;

  InventoryDataState({
    required this.inventoryProducts,
    required this.invoiceItems,
  });
}