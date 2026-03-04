import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_text/sales_text/sales_screen_text.dart';
import '../customer_info_section.dart';
import '../product_search_section.dart';
import 'invoice_items_table.dart';

class SalesInvoiceTab extends StatelessWidget {
  const SalesInvoiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const CustomerInfoSection(),
          const ProductSearchSection(),
          const Card(child: InvoiceItemsTable()),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
                onPressed: () {},
                child:  Text(SalesStrings.addInvoice)
            ),
          )
        ],
      ),
    );
  }
}