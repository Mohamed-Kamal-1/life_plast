import 'package:accounting_desktop/features/sales/presentation/view/invoice/Sales_Invoice_Tab/product_search_Invoice_Tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/sales_cubit.dart';
import '../../../view_model/cubit/sales_invoice_state.dart';
import '../../../widget/InvoiceHeaderSection.dart';
import '../invoice_items_table.dart';
import 'display_invoice_info.dart';

class SalesInvoiceTab extends StatefulWidget {
  final String invoiceTitleButton;

  const SalesInvoiceTab({super.key, required this.invoiceTitleButton});

  @override
  State<SalesInvoiceTab> createState() => _SalesInvoiceTabState();
}

class _SalesInvoiceTabState extends State<SalesInvoiceTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const InvoiceHeaderSection(),
          const ProductSearchInvoiceTab(),
          const DisplayInvoiceInfo(),
          const SizedBox(height: 20),
          Card(child: InvoiceItemsTable()),
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
                  context.read<SalesInvoiceCubit>().saveInvoice(isReturn: false);
                },
                child: Text(widget.invoiceTitleButton),
              ),
            ),
          )
        ],
      ),
    );
  }
}