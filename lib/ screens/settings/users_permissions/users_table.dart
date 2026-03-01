import 'package:flutter/material.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('المستخدم')),
          DataColumn(label: Text('الدور')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('admin')),
            DataCell(Text('مدير النظام')),
          ]),
          DataRow(cells: [
            DataCell(Text('sales1')),
            DataCell(Text('مبيعات')),
          ]),
        ],
      ),
    );
  }
}