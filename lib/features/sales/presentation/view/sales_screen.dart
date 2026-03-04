import 'package:flutter/material.dart';

import '../../../../core/app_text/sales_text/sales_screen_text.dart';
import 'invoice/sales_invoice_tab.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: SalesStrings.salesTab),
              Tab(text: SalesStrings.returnsTab),
              Tab(text: SalesStrings.invoicesLogTab),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SalesInvoiceTab(),
            // SalesReturnTab(),
            // InvoicesLogTab(),
          ],
        ),
      ),
    );
  }
}