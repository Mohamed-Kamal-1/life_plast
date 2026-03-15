import 'package:accounting_desktop/features/sales/presentation/view_model/cubit/sales_invoice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../all_data_service/data/models/product_model.dart';
import '../../../data/models/invoice_item_model.dart';

@injectable
class SalesInvoiceCubit extends Cubit<SalesInvoiceState> {
  final ProductService _service;

  SalesInvoiceCubit(this._service) : super(SalesInvoiceInitial());

  String _invNum = '';
  String _custName = '';
  String _repName = '';
  String _phone = '';
  String _date = '';

  void loadInvoiceData() {
    _update();
  }

  void updateHeader({String? cust, String? rep, String? ph, String? date}) {
    if (_service.nextInvoiceNumber != 0) {
      _invNum = _service.nextInvoiceNumber.toString();
    }
    if (cust != null) _custName = cust;
    if (rep != null) _repName = rep;
    if (ph != null) _phone = ph;
    if (date != null) _date = date;
    _update();
  }

  void addProduct(ProductModel product, int qty) {
    final invoiceItem = product.copyWith(newQuantity: qty);
    _service.addToInvoice(invoiceItem);
    _update();
  }

  void removeProduct(
    int index,
  ) {
    _service.removeFromInvoice(index);
    _update();
  }

  void _update() {
    emit(SalesInvoiceUpdated(
      items: List.from(_service.invoiceItems),
      total: _service.invoiceTotal,
      invoiceNum: _invNum,
      customerName: _custName,
      repName: _repName,
      phone: _phone,
      date: _date,
    ));
  }

  // داخل SalesInvoiceCubit
  // void saveInvoice() {
  //   final invoice = InvoiceModel(
  //     id: _invNum,
  //     customerName: _custName,
  //     repName: _repName,
  //     phone: _phone,
  //     date: _date,
  //     items: List.from(_service.invoiceItems),
  //     total: _service.invoiceTotal,
  //   );
  //
  //   _service.saveInvoice(invoice);
  //
  //   // تصفير المتغيرات المحلية فوراً بعد الحفظ
  //   _custName = '';
  //   _repName = '';
  //   _phone = '';
  //   _date = '';
  //   _invNum = _service.nextInvoiceNumber.toString(); // تحديث الرقم للتالي
  //
  //   // تحديث الواجهة ببيانات فارغة تماماً
  //   _update();
  // }

  // sales_invoice_cubit.dart
  void saveInvoice({bool isReturn = false}) {
    late final invoice = InvoiceModel(
        id: _invNum,
        customerName: _custName,
        repName: _repName,
        phone: _phone,
        date: _date,
        items: List.from(_service.invoiceItems),
        total: _service.invoiceTotal,
        isReturn: isReturn);

    String validationValue = validation(invoice);

    if (validationValue == 'success') {
      _service.saveInvoice(invoice, isPurchase: false);
    }
    validationInputs(invoice);

    // تنفيذ لوجيك الخصم والتصفير
    emit(SalesInvoiceUpdated(
      items: [],
      total: 0.0,
      invoiceNum: '',
      customerName: '',
      repName: '',
      phone: '',
      date: '',
    ));
    // تحديث الحالة بقائمة فارغة وإجمالي صفر
    emit(SalesInvoiceUpdated(items: [], total: 0.0));

    // (اختياري) ممكن تعمل emit لـ State تانية تطلع رسالة نجاح
  }

  // داخل SalesInvoiceCubit

  void resetInvoiceSystem() {
    // تنفيذ المسح في السيرفس
    _service.clearInvoiceHistory();

    // إعادة ضبط رقم الفاتورة في الكيوبيت ليكون "1"
    _invNum = _service.nextInvoiceNumber.toString();

    // تصفير باقي الحقول
    _custName = '';
    _repName = '';
    _phone = '';

    // إرسال الحالة الجديدة للـ UI
    _update();
  }

  void validationInputs(InvoiceModel invoice) {
    emit(SalesInvoiceSaveEmptyState(errorMessage: validation(invoice)));
  }

  String validation(InvoiceModel invoice) {
    if (invoice.customerName.isEmpty)
      return 'يرجى إدخال اسم العميل أولاً';
    else if (invoice.repName.isEmpty) {
      return 'يرجى إدخال اسم المورد أولاً';
    } else if (invoice.phone.isEmpty) {
      return 'يرجى إدخال الهاتف ';
    } else if (invoice.date.isEmpty) {
      return 'يرجى التاريخ ';
    } else if (invoice.items.isEmpty) {
      return 'يرجى الصنف ';
    } else {
      return 'success';
    }
  }
}

// String validation() {
//   // 1. التحقق من البيانات الأساسية (اسم العميل والجدول)
//   if (_custName
//       .trim()
//       .isEmpty) {
//     return 'يرجى إدخال اسم العميل أولاً'; // وقف التنفيذ هنا ومكملش حفظ
//   }
//
//   if (_service.invoiceItems.isEmpty) {
//     return 'الفاتورة فارغة! أضف أصنافاً أولا'; // وقف التنفيذ
//   }
// }
