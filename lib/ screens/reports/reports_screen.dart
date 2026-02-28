import 'package:flutter/material.dart';
import '../../ widgets/app_screen.dart';
import '../../ widgets/table_box.dart';


class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: 'التقارير',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Filters
          Row(
            children: const [
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'نوع التقرير'))),
              SizedBox(width: 16),
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'من تاريخ'))),
              SizedBox(width: 16),
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'إلى تاريخ'))),
            ],
          ),

          const SizedBox(height: 20),

          /// Report Table
          TableBox(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('البيان')),
                DataColumn(label: Text('القيمة')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('إجمالي المبيعات')),
                  DataCell(Text('1,250,000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('إجمالي المشتريات')),
                  DataCell(Text('820,000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('صافي الربح')),
                  DataCell(Text('430,000')),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}