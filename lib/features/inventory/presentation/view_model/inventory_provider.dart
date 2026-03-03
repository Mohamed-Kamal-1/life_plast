// import 'package:flutter/material.dart';
//
// // الموديل الموحد
// class InventoryItem {
//   final String code;
//   final String name;
//   final double costPrice;
//   final double salePrice;
//   double quantity;
//
//   InventoryItem({
//     required this.code,
//     required this.name,
//     required this.costPrice,
//     required this.salePrice,
//     required this.quantity,
//   });
// }
//
// class InventoryProvider with ChangeNotifier {
//   // القائمة الرئيسية للمخزن
//   List<InventoryItem> _inventoryList = [
//     InventoryItem(code: 'PL-1001', name: 'جردل بلاستيك 20 لتر', costPrice: 150, salePrice: 185, quantity: 5200),
//     InventoryItem(code: 'PL-2033', name: 'غطاء بلاستيك', costPrice: 10, salePrice: 15, quantity: 850),
//   ];
//
//   // قائمة أصناف فاتورة المبيعات
//   List<InventoryItem> _invoiceItems = [];
//
//   List<InventoryItem> get inventoryList => _inventoryList;
//   List<InventoryItem> get invoiceItems => _invoiceItems;
//
//   // إضافة صنف للمخزن
//   void addItemToInventory(InventoryItem item) {
//     _inventoryList.add(item);
//     notifyListeners();
//   }
//
//   // حذف من المخزن
//   void deleteFromInventory(InventoryItem item) {
//     _inventoryList.remove(item);
//     notifyListeners();
//   }
//
//   // إرسال صنف للمبيعات
//   void addToInvoice(InventoryItem item) {
//     _invoiceItems.add(item);
//     notifyListeners();
//   }
//
//   // حذف من الفاتورة
//   void removeFromInvoice(int index) {
//     _invoiceItems.removeAt(index);
//     notifyListeners();
//   }
// }