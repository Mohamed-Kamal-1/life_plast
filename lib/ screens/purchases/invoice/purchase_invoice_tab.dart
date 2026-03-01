import 'package:flutter/material.dart';

import 'purchase_invoice_header.dart';
import 'purchase_items_table.dart';
import 'purchase_invoice_summary.dart';

class PurchaseInvoiceTab extends StatelessWidget {
  const PurchaseInvoiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              PurchaseInvoiceHeader(),
              SizedBox(height: 12),
              Expanded(child: PurchaseItemsTable()),
            ],
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: PurchaseInvoiceSummary(),
        ),
      ],
    );
  }
}