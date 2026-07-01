import '../entities/product_entity.dart';

abstract class InventoryRepository {
  Future<List<ProductEntity>> getProducts();
  Future<void> addProduct(ProductEntity product);
  Future<void> deleteProduct(String id);
  Future<List<ProductEntity>> searchProducts(String query);
}
