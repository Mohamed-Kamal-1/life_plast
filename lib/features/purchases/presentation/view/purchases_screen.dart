import 'package:accounting_desktop/features/purchases/presentation/view/PurchaseLog/PurchaseLogTab.dart';
import 'package:accounting_desktop/features/purchases/presentation/view/tabs/invoice/purchase_invoice_tab.dart';
import 'package:accounting_desktop/features/purchases/presentation/view/tabs/returns/purchase_return_tab.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_text/purchases_text/purchases_screen_text.dart';




class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إدارة المشتريات"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: PurchaseStrings.purchaseTab),
              Tab(text: PurchaseStrings.returnsTab),
              Tab(text: PurchaseStrings.logTab),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PurchaseInvoiceTab(),
            PurchaseReturnTab(),
            PurchaseLogTab(),
          ],
        ),
      ),
    );
  }
}