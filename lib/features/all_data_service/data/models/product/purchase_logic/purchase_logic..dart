import 'dart:convert';

import 'package:accounting_desktop/features/all_data_service/data/models/product/product_data/product_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../sales/data/models/invoice_item_model.dart';
import '../../product_model.dart';

mixin PurchaseLogic on ProductData {
  static const String purchaseInvoiceKey = 'all_purchase_log';
  static const String purchaseInvoiceNumberKey = 'last_purchase_inv_num';

  Future<void> loadSavedPurchaseInvoices() async {
    final prefs = await SharedPreferences.getInstance();

    // تحميل آخر رقم فاتورة تم استخدامه
    lastPurchaseInvNum = prefs.getInt(purchaseInvoiceNumberKey) ?? 0;

    final String? savedData = prefs.getString(purchaseInvoiceKey);
    if (savedData != null) {
      List<dynamic> decodedData = json.decode(savedData);
      allLogPurchaseInvoices =
          decodedData.map((item) => InvoiceModel.fromJson(item)).toList();
    }
  }

  void addToPurchaseInvoice(ProductModel product) {
    currentPurchaseInvoiceItems.add(product);
  }

  void removeFromPurchaseInvoice(int index) {
    currentPurchaseInvoiceItems.removeAt(index);
  }

  void savePurchaseInvoice(InvoiceModel invoice) async {
    final prefs = await SharedPreferences.getInstance();
    lastPurchaseInvNum++;
    allLogPurchaseInvoices.add(invoice);
    await prefs.setInt(purchaseInvoiceNumberKey, lastPurchaseInvNum);

    String encodedData =
        json.encode(allLogPurchaseInvoices.map((inv) => inv.toJson()).toList());
    await prefs.setString(purchaseInvoiceKey, encodedData);
    currentPurchaseInvoiceItems.clear(); // تصفير قائمة المشتريات
  }

  double get purchaseTotal => currentPurchaseInvoiceItems.fold(
      0, (sum, item) => sum + (item.buyingPrice * item.quantity));
}
