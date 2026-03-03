import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_text/sales_text/sales_screen_text.dart';
import 'invoice/sales_invoice_tab.dart';
import 'quotations/quotations_tab.dart';
import 'returns/sales_return_screen.dart';

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
    // استخدام sizeOf كما طلبت
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isMobile = screenWidth < 800;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 8.0 : Dimension.padding16),
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
                // SalesInvoiceTab(),
                SalesReturnScreen(),
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

class SalesHeader extends StatelessWidget {
  const SalesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isMobile = screenWidth < 700;

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(SalesScreenText.mainTitle,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  _ActionBtn(SalesScreenText.btnNew, Icons.add),
                  _ActionBtn(SalesScreenText.btnSave, Icons.save),
                  _ActionBtn(SalesScreenText.btnVerify, Icons.verified),
                  _ActionBtn(SalesScreenText.btnPrint, Icons.print),
                ],
              ),
            ],
          )
        : Row(
            children: [
              Text(SalesScreenText.mainTitle,
                  style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              const _ActionBtn(SalesScreenText.btnNew, Icons.add),
              const _ActionBtn(SalesScreenText.btnSave, Icons.save),
              const _ActionBtn(SalesScreenText.btnVerify, Icons.verified),
              const _ActionBtn(SalesScreenText.btnPrint, Icons.print),
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
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: Dimension.size15),
      label: Text(title),
    );
  }
}
