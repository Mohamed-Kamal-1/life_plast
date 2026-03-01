import 'package:accounting_desktop/%20screens/sales/quotations/quotations_tab.dart';
import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';
import 'package:flutter/material.dart';

import '../../core/app_text/sales_text/sales_screen_text.dart';
import 'invoice/sales_invoice_tab.dart';


class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimension.padding16),
      child: Column(
        children: [
          const SalesHeader(),
          const SizedBox(height: Dimension.heightSizeBox12),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(text: SalesScreenText.tabInvoice),
              Tab(text: SalesScreenText.tabReturns),
              Tab(text: SalesScreenText.tabQuotations),
              Tab(text: SalesScreenText.tabCollections),
            ],
          ),
          const SizedBox(height: Dimension.heightSizeBox12),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                SalesInvoiceTab(),
                Center(child: Text(SalesScreenText.tabReturns)),
                QuotationsTab(),
                Center(child: Text(SalesScreenText.tabCollections)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================= HEADER =================
class SalesHeader extends StatelessWidget {
  const SalesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          SalesScreenText.mainTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        _ActionBtn(SalesScreenText.btnNew, Icons.add),
        _ActionBtn(SalesScreenText.btnSave, Icons.save),
        _ActionBtn(SalesScreenText.btnVerify, Icons.verified),
        _ActionBtn(SalesScreenText.btnPrint, Icons.print),
      ],
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ActionBtn(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimension.padding4),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: Dimension.size18),
        label: Text(title),
      ),
    );
  }
}