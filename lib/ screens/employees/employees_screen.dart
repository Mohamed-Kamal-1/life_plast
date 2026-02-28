import 'package:flutter/material.dart';
import '../../ widgets/action_button.dart';
import '../../ widgets/app_screen.dart';
import '../../ widgets/table_box.dart';


class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen>
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
      title: 'الموظفين والمندوبين',
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: 'الموظفين'),
              Tab(text: 'المندوبين'),
              Tab(text: 'إضافة'),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _employeesList(),
                _representativesList(),
                _addEmployee(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _employeesList() {
    return TableBox(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('الاسم')),
          DataColumn(label: Text('الوظيفة')),
          DataColumn(label: Text('الراتب')),
          DataColumn(label: Text('الحالة')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('أحمد علي')),
            DataCell(Text('محاسب')),
            DataCell(Text('6,000')),
            DataCell(Text('نشط')),
          ]),
        ],
      ),
    );
  }

  Widget _representativesList() {
    return TableBox(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('الاسم')),
          DataColumn(label: Text('المنطقة')),
          DataColumn(label: Text('العمولة')),
          DataColumn(label: Text('الحالة')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('محمد حسن')),
            DataCell(Text('الدلتا')),
            DataCell(Text('5%')),
            DataCell(Text('نشط')),
          ]),
        ],
      ),
    );
  }

  Widget _addEmployee() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'الاسم'))),
              SizedBox(width: 16),
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'الوظيفة'))),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'الراتب / العمولة'))),
              SizedBox(width: 16),
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'رقم الهاتف'))),
            ],
          ),
          const SizedBox(height: 20),
          const ActionButton(title: 'حفظ', icon: Icons.save),
        ],
      ),
    );
  }
}