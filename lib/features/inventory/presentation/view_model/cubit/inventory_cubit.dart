import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../all_data_service/data/models/product_model.dart';
import 'inventory_state.dart';

@injectable
class InventoryCubit extends Cubit<InventoryState> {
  final ProductService _service;

  InventoryCubit(this._service) : super(InventoryInitial());

  // دالة لجلب البيانات في البداية
  void loadProducts() {
    emit(InventoryDataState(inventoryProducts: List.from(_service.products)));
  }

  // دالة الإضافة التي ستحقق التحديث اللحظي
  void addProduct(ProductModel product) {
    _service.addProduct(product); // 1. الحفظ في السيرفس

    // 2. إرسال حالة جديدة بالقائمة كاملة بعد التحديث
    // استخدمنا List.from لضمان أن Flutter يدرك أن القائمة تغيرت (Refrence جديد)
    emit(InventoryDataState(inventoryProducts: List.from(_service.products)));
  }

  void deleteProduct(String name) {
    _service.deleteProduct(name); // الحذف من السيرفس
    loadProducts(); // إعادة تحميل اللستة وعمل emit للحالة الجديدة لتحديث الـ UI
  }
}