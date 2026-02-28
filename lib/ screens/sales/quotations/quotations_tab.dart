import 'package:flutter/material.dart';

import 'quotation_form.dart';
import 'quotation_items_table.dart';
import 'quotation_summary.dart';

class QuotationsTab extends StatelessWidget {
  const QuotationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              QuotationForm(),
              SizedBox(height: 12),
              Expanded(child: QuotationItemsTable()),
            ],
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: QuotationSummary(),
        ),
      ],
    );
  }
}