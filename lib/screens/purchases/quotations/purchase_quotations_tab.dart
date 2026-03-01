import 'package:flutter/material.dart';

import 'purchase_quotation_form.dart';
import 'purchase_quotation_items_table.dart';
import 'purchase_quotation_summary.dart';

class PurchaseQuotationsTab extends StatelessWidget {
  const PurchaseQuotationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              PurchaseQuotationForm(),
              SizedBox(height: 12),
              Expanded(child: PurchaseQuotationItemsTable()),
            ],
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: PurchaseQuotationSummary(),
        ),
      ],
    );
  }
}