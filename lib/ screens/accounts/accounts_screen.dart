import 'package:flutter/material.dart';

import '../../ widgets/action_button.dart';
import '../../ widgets/app_screen.dart';
import '../../ widgets/table_box.dart';



class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: 'التجار',
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: 'عرض التجار'),
              Tab(text: 'إضافة تاجر'),
              Tab(text: 'حسابات التاجر'),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _tradersList(),
                _addTrader(),
                _traderAccounts(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tradersList() {
    return TableBox(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('الاسم')),
          DataColumn(label: Text('النوع')),
          DataColumn(label: Text('الهاتف')),
          DataColumn(label: Text('المدينة')),
          DataColumn(label: Text('الحالة')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('شركة النور')),
            DataCell(Text('عميل')),
            DataCell(Text('0100000000')),
            DataCell(Text('القاهرة')),
            DataCell(Text('نشط')),
          ]),
        ],
      ),
    );
  }

  Widget _addTrader() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'اسم التاجر'))),
              SizedBox(width: 16),
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'نوع التاجر (عميل/مورد)'))),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'رقم الهاتف'))),
              SizedBox(width: 16),
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'العنوان'))),
            ],
          ),
          const SizedBox(height: 20),
          const ActionButton(title: 'حفظ التاجر', icon: Icons.save),
        ],
      ),
    );
  }

  Widget _traderAccounts() {
    return TableBox(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('التاريخ')),
          DataColumn(label: Text('العملية')),
          DataColumn(label: Text('مدين')),
          DataColumn(label: Text('دائن')),
          DataColumn(label: Text('الرصيد')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('2024-02-10')),
            DataCell(Text('فاتورة بيع')),
            DataCell(Text('')),
            DataCell(Text('35,000')),
            DataCell(Text('35,000')),
          ]),
        ],
      ),
    );
  }
}