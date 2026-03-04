import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/InvoiceHeaderSection.dart';
import '../../product_search_section/product_search_section.dart';

import '../invoice_items_table.dart';

class SalesInvoiceTab extends StatelessWidget {
  final String InvoiceTitleButton;

  const SalesInvoiceTab({super.key, required this.InvoiceTitleButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const InvoiceHeaderSection(),
          const ProductSearchSection(),
          const Card(child: InvoiceItemsTable()),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
                style:
                ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
                onPressed: () {},
                child: Text(InvoiceTitleButton)),
          )
        ],
      ),
    );
  }
}