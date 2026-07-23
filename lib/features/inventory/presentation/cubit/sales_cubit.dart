import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../sales/domain/entities/sale_invoice_entity.dart';
import '../../../sales/domain/repositories/sales_repository.dart';
import 'sales_state.dart';

@injectable
class SalesCubit extends Cubit<SalesState> {
  final SalesRepository salesRepository;

  SalesCubit(this.salesRepository) : super(SalesInitialState());

  Future<void> createInvoice(SaleInvoiceEntity invoice) async {
    emit(SalesLoadingState());

    final response = await salesRepository.createSaleInvoice(invoice);

    // استخدام fold هو الطريقة الوحيدة الصحيحة هنا
    response.fold(
      onSuccess: (_) {
        emit(SalesSuccessState());
      },
      onFailure: (failure) {
        // الـ failure هنا يحمل رسالة الخطأ الجاهزة من الـ Wrapper
        emit(SalesErrorState(errorMessage: failure.message));
      },
    );
  }
}
