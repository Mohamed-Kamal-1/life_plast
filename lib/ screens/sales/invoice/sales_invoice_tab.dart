import 'package:flutter/material.dart';

import 'invoice_header.dart';
import 'invoice_items_table.dart';
import 'invoice_summary.dart';

class SalesInvoiceTab extends StatelessWidget {
  const SalesInvoiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              InvoiceHeader(),
              SizedBox(height: 12),
              Expanded(child: InvoiceItemsTable()),
            ],
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: InvoiceSummary(),
        ),
      ],
    );
  }
}