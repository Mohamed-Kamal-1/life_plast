import 'package:flutter/material.dart';

import '../../../../../core/dimensions/Dimension_app.dart';

import 'quotation_form.dart';
import 'quotation_items_table.dart';
import 'quotation_summary.dart';

class QuotationsTab extends StatelessWidget {
  const QuotationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isMobile = screenWidth < 1100;

    if (isMobile) {
      return SingleChildScrollView(
        child: Column(
          children: const [
            QuotationForm(),
            SizedBox(height: Dimension.heightSizeBox12),
            QuotationSummary(),
            SizedBox(height: Dimension.heightSizeBox12),
            SizedBox(height: 500, child: QuotationItemsTable()),
          ],
        ),
      );
    }

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