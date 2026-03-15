import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/sales_cubit.dart';
import '../../../view_model/cubit/sales_invoice_state.dart';

class DisplayInvoiceInfo extends StatelessWidget {
  const DisplayInvoiceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesInvoiceCubit, SalesInvoiceState>(
      builder: (BuildContext context, state) {
        if (state is SalesInvoiceUpdated) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              spacing: 100,
              runSpacing: 16,

              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomInputPersonInfo(
                  label: state.invoiceNum.isEmpty ? 'رقم الفاتورة' : state.invoiceNum,
                  icon: Icons.numbers,
                ),
                CustomInputPersonInfo(
                  label: state.customerName.isEmpty
                      ? 'ادخل اسم العميل  '
                      : state.customerName,
                  icon: Icons.person,
                ),
                CustomInputPersonInfo(
                  label: state.repName.isEmpty ? 'ادخل اسم المندوب' : state.repName,
                  icon: Icons.badge,
                ),
                CustomInputPersonInfo(
                  label:state.phone.isEmpty ? 'الهاتف' : state.phone,
                  icon: Icons.phone,
                ),
                CustomInputPersonInfo(
                  label: state.date.isEmpty ? 'التاريخ'  : state.date,
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

class CustomInputPersonInfo extends StatelessWidget {
  final String label;
  final IconData icon;

  const CustomInputPersonInfo(
      {super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    bool isDesktop = width > 800;
    return SizedBox(
      width: isDesktop ? 150 : width * 0.4,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            Text(label),
          ],
        ),
      ),
    );
  }
}
