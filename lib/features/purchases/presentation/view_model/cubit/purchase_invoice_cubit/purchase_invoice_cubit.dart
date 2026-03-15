import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../all_data_service/data/models/product_model.dart';
import '../../../../../sales/data/models/invoice_item_model.dart';
import '../purchase_invoice_state/purchase_invoice_state.dart';

@injectable
class PurchaseInvoiceCubit extends Cubit<PurchaseInvoiceState> {
  final ProductService _service;

  PurchaseInvoiceCubit(this._service) : super(PurchaseInvoiceInitial());

  String _invPurchaseNum = '';
  String _supplierName = ''; // مورد بدل عميل
  String _repName = '';
  String _phone = '';
  String _date = '';

  void loadPurchaseInvoiceData() {
    _update();
  }

  void updateHeader({String? supplier, String? rep, String? ph, String? date}) {
    // ✅ يستخدم عداد المشتريات المنفصل اللي ضيفناه في السيرفس
    if (_service.nextInvoicePurchaseNumber >= 0) {
      _invPurchaseNum = (_service.nextInvoicePurchaseNumber + 1).toString();
    }
    if (supplier != null) _supplierName = supplier;
    if (rep != null) _repName = rep;
    if (ph != null) _phone = ph;
    if (date != null) _date = date;
    _update();
  }

  void addProduct(ProductModel product, int qty) {
    final purchaseItem = product.copyWith(newQuantity: qty);
    // ✅ استدعاء دالة إضافة المشتريات المنفصلة
    _service.addToPurchaseInvoice(purchaseItem);
    _update();
  }

  void removeProduct(int index) {
    // ✅ استدعاء دالة حذف المشتريات المنفصلة
    _service.removeFromPurchaseInvoice(index);
    _update();
  }

  void _update() {
    emit(PurchaseInvoiceUpdated(
      items: List.from(_service.purchaseInvoiceItems),
      // ✅ قائمة المشتريات
      total: _service.purchaseTotal,
      // ✅ إجمالي المشتريات (بسعر الشراء)
      purchaseInvoiceNum: _invPurchaseNum,
      supplierName: _supplierName,
      repName: _repName,
      phone: _phone,
      date: _date,
    ));
  }

  void saveInvoicePurchase({bool isReturn = false}) {
    final invoice = InvoiceModel(
      id: _invPurchaseNum,
      customerName: _supplierName,
      // المورد يتم تخزينه في حقل العميل بالموديل
      repName: _repName,
      phone: _phone,
      date: _date,
      items: List.from(_service.purchaseInvoiceItems),
      total: _service.purchaseTotal,
      isReturn: isReturn,
    );

    String validationValue = validation(invoice);

    if (validationValue == 'success') {
      // ✅ نمرر isPurchase: true لزيادة المخزن واستخدام عداد المشتريات
      _service.saveInvoice(invoice, isPurchase: true);
    }
    validationInputs(invoice);

    // تصفير الواجهة بعد الحفظ
    _supplierName = '';
    _repName = '';
    _phone = '';
    _date = '';
    _invPurchaseNum = (_service.nextInvoicePurchaseNumber + 1).toString();

    // إرسال حالة التصفير
    emit(PurchaseInvoiceUpdated(
      items: [],
      total: 0.0,
      purchaseInvoiceNum: _invPurchaseNum,
      supplierName: '',
      repName: '',
      phone: '',
      date: '',
    ));
  }

  void validationInputs(InvoiceModel invoice) {
    emit(PurchaseInvoiceSaveEmptyState(errorMessage: validation(invoice)));
  }

  String validation(InvoiceModel invoice) {
    if (invoice.customerName.isEmpty) {
      return 'يرجى إدخال اسم المورد أولاً';
    } else if (invoice.repName.isEmpty) {
      return 'يرجى إدخال اسم المندوب أولاً';
    } else if (invoice.phone.isEmpty) {
      return 'يرجى إدخال الهاتف';
    } else if (invoice.date.isEmpty) {
      return 'يرجى إدخال التاريخ';
    } else if (invoice.items.isEmpty) {
      return 'يرجى إضافة صنف للفاتورة';
    } else {
      return 'success';
    }
  }

  // دالة لمسح سجل المشتريات فقط إذا أردت (اختياري)
  void resetPurchaseSystem() async {
    // يمكنك إضافة منطق مسح عداد المشتريات فقط في السيرفس
    _invPurchaseNum = (_service.nextInvoicePurchaseNumber + 1).toString();
    _supplierName = '';
    _repName = '';
    _phone = '';
    _update();
  }
}
