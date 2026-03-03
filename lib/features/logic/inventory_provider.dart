import 'package:flutter/material.dart';

// الموديل الوحيد في المشروع
class InventoryItem {
  final String code;
  final String name;
  final double costPrice;
  final double salePrice;
  double quantity;

  InventoryItem({
    required this.code,
    required this.name,
    required this.costPrice,
    required this.salePrice,
    required this.quantity,
  });
}

class InventoryProvider with ChangeNotifier {
  // قائمة المخزن (الأساسية)
  final List<InventoryItem> _inventoryList = [
    InventoryItem(code: 'PL-1001', name: 'جردل بلاستيك 20 لتر', costPrice: 150, salePrice: 185, quantity: 5200),
  ];

  // قائمة الفاتورة (المختارة)
  final List<InventoryItem> _invoiceItems = [];

  // Getters عشان الصفحات تشوف البيانات
  List<InventoryItem> get inventoryList => _inventoryList;
  List<InventoryItem> get invoiceItems => _invoiceItems;

  // إضافة صنف جديد للمخزن
  void addItemToInventory(InventoryItem item) {
    _inventoryList.add(item);
    notifyListeners();
  }

  // إضافة صنف للفاتورة عند الاختيار
  void addToInvoice(InventoryItem product) {
    // لو موجود زود كمية، لو مش موجود ضيفه
    int index = _invoiceItems.indexWhere((item) => item.code == product.code);
    if (index != -1) {
      _invoiceItems[index].quantity += 1;
    } else {
      _invoiceItems.add(InventoryItem(
        code: product.code,
        name: product.name,
        costPrice: product.costPrice,
        salePrice: product.salePrice,
        quantity: 1, // كمية افتراضية للفاتورة
      ));
    }
    notifyListeners();
  }

  void removeFromInvoice(int index) {
    _invoiceItems.removeAt(index);
    notifyListeners();
  }
}