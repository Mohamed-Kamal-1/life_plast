import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/product_model.dart';
import 'inventory_state.dart';

@injectable
class InventoryCubit extends Cubit<InventoryState> {
  final ProductService _service;

  // نستخدم الـ Service هنا مباشرة
  InventoryCubit(this._service) : super(InventoryInitial());

  void loadProducts() {
    emit(InventoryDataState(inventoryProducts: _service.products));
  }
}
