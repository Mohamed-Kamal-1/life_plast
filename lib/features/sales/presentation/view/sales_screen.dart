import 'package:accounting_desktop/features/sales/presentation/view/returns/sales_return_tab.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_text/sales_text/sales_screen_text.dart';
import 'invoice/Invoices_Log/Invoices_Log_Tab.dart';
import 'invoice/Sales_Invoice_Tab/Sales_Invoice_Tab.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SalesStrings.mangeSales),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: SalesStrings.salesTab),
              Tab(text: SalesStrings.returnsTab),
              Tab(text: SalesStrings.invoicesLogTab),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SalesInvoiceTab(
              InvoiceTitleButton: SalesStrings.addInvoice,
            ),
            SalesReturnTab(
              InvoiceTitleButton: SalesStrings.addReturn,
            ),
            InvoicesLogTab(),
          ],
        ),
      ),
    );
  }
}