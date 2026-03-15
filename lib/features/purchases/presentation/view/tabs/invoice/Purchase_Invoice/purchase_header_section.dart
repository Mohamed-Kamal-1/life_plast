import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/widget/date_widget.dart';
import '../../../../../../all_data_service/data/models/product_model.dart';
import '../../../../../../sales/presentation/widget/custom_input_Field.dart';
import '../../../../view_model/cubit/purchase_invoice_cubit/purchase_invoice_cubit.dart';
import '../../../../view_model/cubit/purchase_invoice_state/purchase_invoice_state.dart';

class PurchaseHeaderSection extends StatelessWidget {
  const PurchaseHeaderSection({super.key});

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
      child: BlocBuilder<PurchaseInvoiceCubit, PurchaseInvoiceState>(
        builder: (context, state) {
          return Container(
            key: ValueKey(state is PurchaseInvoiceUpdated && state.items.isEmpty
                ? "reset"
                : "active"),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                    width: isDesktop ? 150 : width * 0.4,
                    child: Text(getIt
                        .get<ProductService>()
                        .nextInvoicePurchaseNumber
                        .toString())),
                SizedBox(
                    width: isDesktop ? 300 : double.infinity,
                    child: CustomInputField(
                        onChanged: (v) => context
                            .read<PurchaseInvoiceCubit>()
                            .updateHeader(supplier: v),
                        // ✅ تحديث اسم المورد
                        label: "اسم المورد",
                        // ✅ تعديل النص
                        icon: Icons.store)), // ✅ أيقونة مختلفة للمورد
                SizedBox(
                    width: isDesktop ? 250 : double.infinity,
                    child: CustomInputField(
                        onChanged: (v) => context
                            .read<PurchaseInvoiceCubit>()
                            .updateHeader(rep: v),
                        label: "اسم المندوب",
                        icon: Icons.badge)),
                SizedBox(
                    width: isDesktop ? 200 : width * 0.45,
                    child: CustomInputField(
                        onChanged: (v) => context
                            .read<PurchaseInvoiceCubit>()
                            .updateHeader(ph: v),
                        label: "رقم الهاتف",
                        icon: Icons.phone)),
                SizedBox(
                  width: isDesktop ? 180 : width * 0.45,
                  child: DatePickerField(
                      labelText: "التاريخ",
                      onChanged: (date) {
                        if (date != null) {
                          String formattedDate =
                              "${date.year}-${date.month}-${date.day}";
                          context
                              .read<PurchaseInvoiceCubit>()
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
