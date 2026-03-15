import 'package:accounting_desktop/features/all_data_service/data/models/product_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../sales/data/models/invoice_item_model.dart';

mixin ProductData {
  @protected
  int lastInvoiceNumber = 0;

  int get nextInvoiceNumber => lastInvoiceNumber + 1;

  @protected
  int lastReturnSalesInvNum = 0; // مرتجع مبيعات

  int get nextInvoiceReturnNumber => lastReturnSalesInvNum + 1;

  @protected
  int lastPurchaseInvNum = 0;

  int get nextInvoicePurchaseNumber => lastPurchaseInvNum + 1;

  @protected
  int lastReturnPurchaseInvNum = 0; // مرتجع مشتريات

  int get nextInvoiceReturnPurchaseNumber => lastReturnPurchaseInvNum + 1;

  @protected
  List<ProductModel> allProducts = [];

  List<ProductModel> get products => allProducts;

  @protected
  List<ProductModel> currentPurchaseInvoiceItems =
      []; // ✅ قائمة جديدة تماماً للمشتريات

  List<ProductModel> get purchaseInvoiceItems => currentPurchaseInvoiceItems;

  @protected
  final List<ProductModel> currentInvoiceItems = [];

  List<ProductModel> get invoiceItems => currentInvoiceItems;

  @protected
  List<InvoiceModel> allSalesLogInvoices = [];

  List<InvoiceModel> get allSavedSalesLogInvoices => allSalesLogInvoices;


  @protected
  List<InvoiceModel> allSalesReturnLogInvoices = [];

  List<InvoiceModel> get allSavedSalesReturnLogInvoices => allSalesReturnLogInvoices;


  @protected
  List<InvoiceModel> allLogPurchaseInvoices = [];

  List<InvoiceModel> get allSavedLogPurchaseInvoices => allLogPurchaseInvoices;

  @protected
  final List<ProductModel> initialData = [
    ProductModel(
        name: "صنف تجريبي 1",
        buyingPrice: 100,
        sellingPrice: 150,
        quantity: 50),
    ProductModel(
        name: "صنف تجريبي 2",
        buyingPrice: 200,
        sellingPrice: 280,
        quantity: 30),
  ];
}
