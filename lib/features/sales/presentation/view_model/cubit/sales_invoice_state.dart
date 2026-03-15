import '../../../../all_data_service/data/models/product_model.dart';

abstract class SalesInvoiceState {}

class SalesInvoiceInitial extends SalesInvoiceState {}

class SalesInvoiceUpdated extends SalesInvoiceState {
  final List<ProductModel> items;
  final double total;
  final String invoiceNum;
  final String customerName;
  final String repName;
  final String phone;
  final String date;
  final bool isReturn;

  SalesInvoiceUpdated({
    required this.items,
    this.total = 0.0,
    this.invoiceNum = '',
    this.customerName = '',
    this.repName = '',
    this.phone = '',
    this.date = '',
     this.isReturn = false,
  });
}

class SalesInvoiceSaveErrorState extends SalesInvoiceState {
  final String errorMessage;

  SalesInvoiceSaveErrorState({required this.errorMessage});
}

class SalesInvoiceSaveEmptyState extends SalesInvoiceState {
  final String errorMessage;

  SalesInvoiceSaveEmptyState({required this.errorMessage});
}
