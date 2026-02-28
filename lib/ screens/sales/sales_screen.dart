import 'package:accounting_desktop/%20screens/sales/quotations/quotations_tab.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SalesHeader(),
          const SizedBox(height: 12),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(text: 'فاتورة بيع'),
              Tab(text: 'مرتجعات'),
              Tab(text: 'عروض أسعار'),
              Tab(text: 'تحصيلات'),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                SalesInvoiceTab(),
                // SalesReturnTab(),
                QuotationsTab(),
                Center(child: Text('التحصيلات')),
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
        const Text(
          'المبيعات',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        _ActionBtn('جديد', Icons.add),
        _ActionBtn('حفظ', Icons.save),
        _ActionBtn('اعتماد', Icons.verified),
        _ActionBtn('طباعة', Icons.print),
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
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18),
        label: Text(title),
      ),
    );
  }
}
