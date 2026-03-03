import 'package:accounting_desktop/features/sales/presentation/view/returns/sales_return_actions.dart';
import 'package:accounting_desktop/features/sales/presentation/view/returns/sales_return_header.dart';
import 'package:accounting_desktop/features/sales/presentation/view/returns/sales_return_items_table.dart';
import 'package:flutter/material.dart';

import '../../../../../ widgets/empty_state.dart';



class SalesReturnScreen extends StatelessWidget {
  const SalesReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool hasInvoiceLoaded = false; // Static

    return Column(
      children: [
        const SalesReturnHeader(),
        const SizedBox(height: 12),
        Expanded(
          child: hasInvoiceLoaded
              ? const SalesReturnItemsTable()
              : const EmptyState(
            message: 'برجاء إدخال رقم فاتورة البيع وتحميلها',
          ),
        ),
        const SizedBox(height: 12),
        const SalesReturnActions(),
      ],
    );
  }
}