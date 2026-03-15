import '../../../../../all_data_service/data/models/product_model.dart';

abstract class PurchaseInvoiceState {}

class PurchaseInvoiceInitial extends PurchaseInvoiceState {}

class PurchaseInvoiceUpdated extends PurchaseInvoiceState {
  final List<ProductModel> items;
  final double total;
  final String purchaseInvoiceNum;
  final String supplierName; // المورد بدل العميل
  final String repName;
  final String phone;
  final String date;

  PurchaseInvoiceUpdated({
    required this.items,
    required this.total,
    this.purchaseInvoiceNum = '',
    this.supplierName = '',
    this.repName = '',
    this.phone = '',
    this.date = '',
  });
}

class PurchaseInvoiceSaveEmptyState extends PurchaseInvoiceState {
  final String errorMessage;
  PurchaseInvoiceSaveEmptyState({required this.errorMessage});
}