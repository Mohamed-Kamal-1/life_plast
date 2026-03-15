import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../sales/presentation/view/invoice/Sales_Invoice_Tab/display_invoice_info.dart';
import '../../../../view_model/cubit/purchase_invoice_cubit/purchase_invoice_cubit.dart';
import '../../../../view_model/cubit/purchase_invoice_state/purchase_invoice_state.dart';


class DisplayPurchaseInfo extends StatelessWidget {
  const DisplayPurchaseInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseInvoiceCubit, PurchaseInvoiceState>(
      builder: (BuildContext context, state) {
        if (state is PurchaseInvoiceUpdated) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              spacing: 100,
              runSpacing: 16,
              children: [
                CustomInputPersonInfo(
                  label: state.purchaseInvoiceNum.isEmpty ? 'رقم الفاتورة' : state.purchaseInvoiceNum,
                  icon: Icons.numbers,
                ),
                CustomInputPersonInfo(
                  // ✅ عرض اسم المورد هنا
                  label: state.supplierName.isEmpty
                      ? 'ادخل اسم المورد'
                      : state.supplierName,
                  icon: Icons.store,
                ),
                CustomInputPersonInfo(
                  label: state.repName.isEmpty ? 'ادخل اسم المندوب' : state.repName,
                  icon: Icons.badge,
                ),
                CustomInputPersonInfo(
                  label: state.phone.isEmpty ? 'الهاتف' : state.phone,
                  icon: Icons.phone,
                ),
                CustomInputPersonInfo(
                  label: state.date.isEmpty ? 'التاريخ' : state.date,
                  icon: Icons.date_range,
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}