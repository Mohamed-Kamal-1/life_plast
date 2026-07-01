import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/add_product_usecase.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/usecases/search_products_usecase.dart';
import 'inventory_state.dart';

@injectable
class InventoryCubit extends Cubit<InventoryState> {
  final GetProductsUseCase _getProductsUseCase;
  final AddProductUseCase _addProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final SearchProductsUseCase _searchProductsUseCase;

  InventoryCubit(
    this._getProductsUseCase,
    this._addProductUseCase,
    this._deleteProductUseCase,
    this._searchProductsUseCase,
  ) : super(InventoryInitial());

  Future<void> fetchProducts() async {
    emit(InventoryLoading());
    try {
      final products = await _getProductsUseCase();
      emit(InventoryLoaded(products));
    } catch (e) {
      emit(InventoryError(e.toString()));
    }
  }

  Future<void> createProduct(ProductEntity product) async {
    try {
      await _addProductUseCase(product);
      await fetchProducts();
    } catch (e) {
      emit(InventoryError(e.toString()));
    }
  }

  Future<void> removeProduct(String id) async {
    try {
      await _deleteProductUseCase(id);
      await fetchProducts();
    } catch (e) {
      emit(InventoryError(e.toString()));
    }
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      await fetchProducts();
      return;
    }
    try {
      final filtered = await _searchProductsUseCase(query);
      emit(InventoryLoaded(filtered));
    } catch (e) {
      emit(InventoryError(e.toString()));
    }
  }
}
