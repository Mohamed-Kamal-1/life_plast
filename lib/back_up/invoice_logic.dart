// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../../sales/data/models/invoice_item_model.dart';
// import '../../product/product_data/product_data.dart';
// import '../../product/product_logic/product_logic.dart';
// import '../../product_model.dart';
//
// mixin InvoiceLogic on ProductData, ProductLogic {
//   @protected
//   Future<void> loadSavedInvoices() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     // تحميل آخر رقم فاتورة تم استخدامه
//     lastInvoiceNumber = prefs.getInt('last_inv_num') ?? 0;
//
//     final String? savedData = prefs.getString('all_saved_invoices');
//     if (savedData != null) {
//       List<dynamic> decodedData = json.decode(savedData);
//       allLogInvoices =
//           decodedData.map((item) => InvoiceModel.fromJson(item)).toList();
//       // ملحوظة: حذفنا هنا كود "if (lastInvDate != todayDate)" تماماً
//     }
//
//     final String? savedPurchases = prefs.getString('all_purchase_log');
//     if (savedPurchases != null) {
//       List<dynamic> decodedData = json.decode(savedPurchases);
//       allLogPurchaseInvoices =
//           decodedData.map((item) => InvoiceModel.fromJson(item)).toList();
//     }
//   }
//
//   void saveInvoice(InvoiceModel invoice, {bool isPurchase = false}) async {
//     final prefs = await SharedPreferences.getInstance();
//     for (var item in invoice.items) {
//       int index = allProducts.indexWhere((p) => p.name == item.name);
//       if (index != -1) {
//         if (invoice.isReturn || isPurchase) {
//           allProducts[index].quantity += item.quantity;
//         } else {
//           allProducts[index].quantity -= item.quantity;
//         }
//       }
//     }
//
//     // ✅ التعديل هنا: فصل زيادة العداد حسب نوع الفاتورة
//     if (isPurchase) {
//       lastPurchaseInvNum++;
//       allLogPurchaseInvoices.add(invoice);
//       await prefs.setInt('last_purchase_inv_num', lastPurchaseInvNum);
//       currentPurchaseInvoiceItems.clear(); // تصفير قائمة المشتريات
//     } else {
//       lastInvoiceNumber++;
//       await prefs.setInt('last_inv_num', lastInvoiceNumber);
//       currentInvoiceItems.clear(); // تصفير قائمة المبيعات
//     }
//
//     // حفظ سجل الفواتير (الـ Log)
//     allLogInvoices.add(invoice);
//     String encodedData =
//     json.encode(allLogInvoices.map((inv) => inv.toJson()).toList());
//     await prefs.setString('all_saved_invoices', encodedData);
//
//     currentInvoiceItems.clear();
//     saveDataToStorage();
//   }
//
//   void addToInvoice(ProductModel product) {
//     currentInvoiceItems.add(product);
//   }
//
//   void removeFromInvoice(int index) {
//     currentInvoiceItems.removeAt(index);
//   }
//
//   Future<void> clearInvoiceHistory() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     // 1. مسح البيانات من الذاكرة الدائمة
//     await prefs.remove('all_saved_invoices');
//     await prefs.remove('last_inv_num');
//
//     // 2. تصفير البيانات في الرام (RAM) عشان الشاشة تتحدث فوراً
//     allLogInvoices.clear();
//     lastInvoiceNumber = 0;
//
//     // (اختياري) لو عاوز تمسح الأصناف الحالية في الجدول برضه
//     currentInvoiceItems.clear();
//   }
//
//   double get invoiceTotal => currentInvoiceItems.fold(
//       0, (sum, item) => sum + (item.sellingPrice * item.quantity));
//
//   double get purchaseInvoiceTotal => currentInvoiceItems.fold(
//       0, (sum, item) => sum + (item.buyingPrice * item.quantity));
// }
