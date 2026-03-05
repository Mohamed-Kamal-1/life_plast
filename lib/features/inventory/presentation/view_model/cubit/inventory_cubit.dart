  // import 'package:flutter_bloc/flutter_bloc.dart';
  // import '../../../data/models/product_model.dart';
  // import 'inventory_state.dart';
  //
  // class InventoryCubit extends Cubit<InventoryState> {
  //   InventoryCubit() : super(InventoryInitial());
  //
  //   // القوائم الحقيقية اللي شايلة البيانات في الرام
  //   List<ProductModel> _allProducts = [];
  //   List<ProductModel> _invoiceItems = [];
  //
  //   // 1. إضافة صنف جديد للمخزن
  //   void addProductToInventory(ProductModel product) {
  //     _allProducts.add(product);
  //     _updateUI();
  //   }
  //
  //   // 2. البحث عن صنف (يستخدم في الـ Search Bar)
  //   List<ProductModel> searchProducts(String query) {
  //     return _allProducts
  //         .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   }
  //
  //   // 3. إضافة صنف من البحث إلى جدول بناء الفاتورة
  //   void addItemToInvoice(ProductModel product, int quantity) {
  //     // نتأكد إن المنتج مش موجود قبل كدا، لو موجود نزود الكمية بس
  //     int index = _invoiceItems.indexWhere((item) => item.id == product.id);
  //
  //     if (index != -1) {
  //       _invoiceItems[index].quantityInInvoice += quantity;
  //     } else {
  //       // نأخد نسخة من المنتج ونحدد كمية الفاتورة
  //       product.quantityInInvoice = quantity;
  //       _invoiceItems.add(product);
  //     }
  //     _updateUI();
  //   }
  //
  //   // 4. حذف صنف من جدول المبيعات (الفاتورة)
  //   void removeItemFromInvoice(String productId) {
  //     _invoiceItems.removeWhere((item) => item.id == productId);
  //     _updateUI();
  //   }
  //
  //   // دالة مساعدة لتحديث الواجهة بكل البيانات الجديدة
  //   void _updateUI() {
  //     emit(InventoryDataState(
  //       inventoryProducts: List.from(_allProducts),
  //       invoiceItems: List.from(_invoiceItems),
  //     ));
  //   }
  // }