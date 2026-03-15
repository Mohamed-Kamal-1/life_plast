import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_text/sales_text/sales_screen_text.dart';
import '../../../../core/di/di.dart';
import '../../../../core/widget/date_widget.dart';
import '../../../all_data_service/data/models/product_model.dart';

import '../view_model/cubit/sales_cubit.dart';
import '../view_model/cubit/sales_invoice_state.dart';
import 'custom_input_Field.dart';

class InvoiceHeaderSection extends StatelessWidget {
  const InvoiceHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    bool isDesktop = width > 800;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: BlocBuilder<SalesInvoiceCubit, SalesInvoiceState>(
        builder: (context, state) {
          return Container(
            key: ValueKey(state is SalesInvoiceUpdated && state.items.isEmpty
                ? "reset"
                : "active"),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                    width: isDesktop ? 150 : width * 0.4,
                    // child: CustomInputField(
                    //     onChanged: (v) => context
                    //         .read<SalesInvoiceCubit>()
                    //         .updateHeader(inv: v),
                    //     label: SalesStrings.invoiceNumber,
                    //     icon: Icons.numbers)),
                    child: Text(getIt
                        .get<ProductService>()
                        .nextInvoiceNumber
                        .toString())),
                SizedBox(
                    width: isDesktop ? 300 : double.infinity,
                    child: CustomInputField(
                        onChanged: (v) => context
                            .read<SalesInvoiceCubit>()
                            .updateHeader(cust: v),
                        label: SalesStrings.customerName,
                        icon: Icons.person)),
                SizedBox(
                    width: isDesktop ? 250 : double.infinity,
                    child: CustomInputField(
                        onChanged: (v) => context
                            .read<SalesInvoiceCubit>()
                            .updateHeader(rep: v),
                        label: SalesStrings.repName,
                        icon: Icons.badge)),
                SizedBox(
                    width: isDesktop ? 200 : width * 0.45,
                    child: CustomInputField(
                        onChanged: (v) => context
                            .read<SalesInvoiceCubit>()
                            .updateHeader(ph: v),
                        label: SalesStrings.phone,
                        icon: Icons.phone)),
                SizedBox(
                  width: isDesktop ? 180 : width * 0.45,
                  child: DatePickerField(
                      labelText: SalesStrings.date,
                      onChanged: (date) {
                        if (date != null) {
                          // تحويل التاريخ لشكل مقروء (مثلاً: 2026-03-09)
                          String formattedDate =
                              "${date.year}-${date.month}-${date.day}";
                          // إرسال التاريخ للكيوبيت
                          context
                              .read<SalesInvoiceCubit>()
                              .updateHeader(date: formattedDate);
                        }
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
