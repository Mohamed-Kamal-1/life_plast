import 'package:accounting_desktop/%20screens/purchases/payments/supplier_payments_tab.dart';
import 'package:flutter/material.dart';

import 'invoice/purchase_invoice_tab.dart';
import 'returns/purchase_return_tab.dart';
import 'quotations/purchase_quotations_tab.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen>
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
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const PurchasesHeader(),
          const SizedBox(height: 12),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(text: 'فاتورة شراء'),
              Tab(text: 'مرتجعات'),
              Tab(text: 'عروض شراء'),
              Tab(text: 'مدفوعات'),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child:TabBarView(
              controller: _tabController,
              children: const [
                PurchaseInvoiceTab(),
                PurchaseReturnTab(),
                PurchaseQuotationsTab(),
                SupplierPaymentsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PurchasesHeader extends StatelessWidget {
  const PurchasesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'المشتريات',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        _HeaderButton('جديد', Icons.add),
        _HeaderButton('حفظ', Icons.save),
        _HeaderButton('اعتماد', Icons.verified),
        _HeaderButton('طباعة', Icons.print),
      ],
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const _HeaderButton(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18),
        label: Text(title),
      ),
    );
  }
}