import 'package:flutter/cupertino.dart';

import '../../../../../sales/data/models/invoice_item_model.dart';
import '../../product/product_data/product_data.dart';
import '../../product/product_logic/product_logic.dart';
import '../../product_model.dart';
import '../purchase_logic/purchase_logic..dart';
import '../sales_logic/sales_logic.dart';

mixin InvoiceLogic on ProductData, ProductLogic, SalesLogic, PurchaseLogic {
  @protected
  Future<void> loadSavedInvoices() async {
    loadSavedSalesInvoices();
    loadSavedPurchaseInvoices();
  }

  void saveInvoice(InvoiceModel invoice, {bool isPurchase = false}) async {
    for (var item in invoice.items) {
      int index = allProducts.indexWhere((p) => p.name == item.name);
      if (index != -1) {
        if (invoice.isReturn || isPurchase) {
          allProducts[index].quantity += item.quantity;
        } else {
          allProducts[index].quantity -= item.quantity;
        }
      }
    }

    // ✅ التعديل هنا: فصل زيادة العداد حسب نوع الفاتورة
    if (isPurchase) {
      savePurchaseInvoice(invoice);
    } else {
      if (invoice.isReturn) {
        saveSalesReturnInvoice(invoice);
      } else {
        saveSalesInvoice(invoice);
      }
    }
    saveDataToStorage();
  }

  void addToInvoice(ProductModel product) {
    currentInvoiceItems.add(product);
  }

  void removeFromInvoice(int index) {
    currentInvoiceItems.removeAt(index);
  }

  void clearInvoiceHistory() {
    clearSalseInvoiceHistory();
  }
}
