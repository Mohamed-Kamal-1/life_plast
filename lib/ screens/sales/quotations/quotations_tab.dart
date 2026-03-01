import 'package:flutter/material.dart';

import '../../../core/dimensions/Dimension_app.dart';
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
          flex: Dimension.flex4,
          child: Column(
            children: [
              QuotationForm(),
              SizedBox(height: Dimension.heightSizeBox12),
              Expanded(child: QuotationItemsTable()),
            ],
          ),
        ),
        SizedBox(width: Dimension.heightSizeBox12),
        Expanded(
          flex: Dimension.flex1,
          child: QuotationSummary(),
        ),
      ],
    );
  }
}