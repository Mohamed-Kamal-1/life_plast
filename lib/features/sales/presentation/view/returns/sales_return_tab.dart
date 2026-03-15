import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubit/sales_cubit.dart';
import '../../view_model/cubit/sales_invoice_state.dart';
import 'Invoice_Item_return_Tabte.dart';
import 'Invoice_return_sales_HeaderSection.dart';
import 'Product_Search_Invoice_Return_Tab.dart';

class SalesReturnTab extends StatelessWidget {
  final String invoiceTitleButton;

  const SalesReturnTab({super.key, required this.invoiceTitleButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const InvoiceReturnSalesHeadersection(),
          const ProductSearchInvoiceReturnTab(),
          const Card(child: InvoiceItemReturnTable()),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: BlocListener<SalesInvoiceCubit, SalesInvoiceState>(
              listener: (context, state) {
                if (state is SalesInvoiceSaveEmptyState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text((state.errorMessage == 'success')
                          ? 'تم حفظ الفاتورة بنجاح'
                          : state.errorMessage),
                      backgroundColor: (state.errorMessage == 'success')
                          ? Colors.green
                          : Colors.red,
                    ),
                  );
                }
              },
              // ✅ لازم الـ child يكون هنا داخل الـ Listener
              child: ElevatedButton(
                style:
                ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
                onPressed: () {
                  context.read<SalesInvoiceCubit>().saveInvoice(isReturn: true);
                },
                child: Text(invoiceTitleButton),
              ),
            ),
          )
        ],
      ),
    );
  }
}