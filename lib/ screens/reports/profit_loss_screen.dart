import 'package:flutter/material.dart';
import '../../ widgets/action_button.dart';
import '../../ widgets/app_screen.dart';
import '../../ widgets/table_box.dart';


class ProfitLossScreen extends StatelessWidget {
  const ProfitLossScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: 'الأرباح والخسائر',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Filters
            Row(
              children: const [
                Expanded(child: TextField(decoration: InputDecoration(labelText: 'من تاريخ'))),
                SizedBox(width: 16),
                Expanded(child: TextField(decoration: InputDecoration(labelText: 'إلى تاريخ'))),
              ],
            ),
            const SizedBox(height: 16),
            const ActionButton(title: 'احتساب', icon: Icons.calculate),

            const SizedBox(height: 24),

            /// Summary
            TableBox(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('البند')),
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
                    DataCell(Text('المصروفات')),
                    DataCell(Text('150,000')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('صافي الربح')),
                    DataCell(Text('280,000')),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}