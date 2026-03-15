import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../sales/data/models/invoice_item_model.dart';
import '../product_data/product_data.dart';

mixin SalesLogic on ProductData {
  static const String invoiceKey = 'all_saved_invoices';
  static const String invoiceNumberKey = 'last_inv_num';

  static const String invoiceReturnKey = 'all_saved_return_invoices';

  static const String invoiceSalesReturnNumberKey = 'last_inv_return_num';

  Future<void> loadSavedSalesInvoices() async {
    final prefs = await SharedPreferences.getInstance();

    lastInvoiceNumber = prefs.getInt(invoiceNumberKey) ?? 0;
    final String? savedSalesData = prefs.getString(invoiceKey);

    lastReturnSalesInvNum = prefs.getInt(invoiceSalesReturnNumberKey) ?? 0;
    final String? savedSalesReturnData = prefs.getString(invoiceReturnKey);

    if (savedSalesData != null) {
      List<dynamic> decodedData = json.decode(savedSalesData);
      allSalesLogInvoices =
          decodedData.map((item) => InvoiceModel.fromJson(item)).toList();
    }

    if (savedSalesReturnData != null) {
      List<dynamic> decodedReturnData = json.decode(savedSalesReturnData);
      allSalesReturnLogInvoices =
          decodedReturnData.map((item) => InvoiceModel.fromJson(item)).toList();
    }
  }

  void saveSalesInvoice(InvoiceModel invoice) async {
    final prefs = await SharedPreferences.getInstance();
    lastInvoiceNumber++;
    await prefs.setInt(invoiceNumberKey, lastInvoiceNumber);
    // currentInvoiceItems.clear(); // تصفير قائمة المبيعات
    allSalesLogInvoices.add(invoice);

    String encodedData =
        json.encode(allSalesLogInvoices.map((inv) => inv.toJson()).toList());
    await prefs.setString(invoiceKey, encodedData);
    currentInvoiceItems.clear(); // تصفير قائمة المبيعات
  }

  void saveSalesReturnInvoice(
    InvoiceModel invoice,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    lastReturnSalesInvNum++;
    await prefs.setInt(invoiceSalesReturnNumberKey, lastReturnSalesInvNum);
    // currentInvoiceItems.clear(); // تصفير قائمة المبيعات
    allSalesReturnLogInvoices.add(invoice);

    String encodedData = json
        .encode(allSalesReturnLogInvoices.map((inv) => inv.toJson()).toList());
    await prefs.setString(invoiceReturnKey, encodedData);
    currentInvoiceItems.clear(); // تصفير قائمة المبيعات
  }

  Future<void> clearSalseInvoiceHistory() async {
    final prefs = await SharedPreferences.getInstance();

    // 1. مسح البيانات من الذاكرة الدائمة
    await prefs.remove(invoiceKey);
    await prefs.remove(invoiceNumberKey);

    // 2. تصفير البيانات في الرام (RAM) عشان الشاشة تتحدث فوراً
    allSalesLogInvoices.clear();
    lastInvoiceNumber = 0;

    // (اختياري) لو عاوز تمسح الأصناف الحالية في الجدول برضه
    currentInvoiceItems.clear();
  }

  double get invoiceTotal => currentInvoiceItems.fold(
      0, (sum, item) => sum + (item.sellingPrice * item.quantity));
}
