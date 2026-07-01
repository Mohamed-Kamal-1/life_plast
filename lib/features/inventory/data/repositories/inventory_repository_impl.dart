import 'package:injectable/injectable.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../datasources/inventory_remote_datasource.dart';
import '../models/product_model.dart';

@Singleton(as: InventoryRepository)
class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryRemoteDataSource _remoteDataSource;

  InventoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    final data = await _remoteDataSource.fetchProducts();
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  Future<void> addProduct(ProductEntity product) async {
    final model = ProductModel(
      id: product.id,
      name: product.name,
      buyingPrice: product.buyingPrice,
      sellingPrice: product.sellingPrice,
      quantity: product.quantity,
    );
    await _remoteDataSource.insertProduct(model.toJson());
  }

  @override
  Future<void> deleteProduct(String id) async {
    await _remoteDataSource.removeProduct(id);
  }

  @override
  Future<List<ProductEntity>> searchProducts(String query) async {
    final data = await _remoteDataSource.searchProducts(query);
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
