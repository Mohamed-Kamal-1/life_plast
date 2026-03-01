import 'package:flutter/material.dart';
import '../../../core/dimensions/Dimension_app.dart';
import 'invoice_header.dart';
import 'invoice_items_table.dart';
import 'invoice_summary.dart';

class SalesInvoiceTab extends StatelessWidget {
  const SalesInvoiceTab({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 950) {
        return SingleChildScrollView(
          child: Column(
            children: const [
              InvoiceHeader(),
              SizedBox(height: Dimension.heightSizeBox12),
              SizedBox(height: 400, child: InvoiceItemsTable()), // طول محدد للموبايل
              SizedBox(height: Dimension.heightSizeBox12),
              InvoiceSummary(),
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
                InvoiceHeader(),
                SizedBox(height: Dimension.heightSizeBox12),
                Expanded(child: InvoiceItemsTable()),
              ],
            ),
          ),
          SizedBox(width: Dimension.heightSizeBox12),
          Expanded(flex: Dimension.flex1, child: InvoiceSummary()),
        ],
      );
    });
  }
}