import 'package:flutter/material.dart';

class WarehouseTransactionsTable extends StatelessWidget {
  const WarehouseTransactionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('التاريخ')),
            DataColumn(label: Text('العملية')),
            DataColumn(label: Text('الكمية')),
            DataColumn(label: Text('الرصيد')),
          ],
          rows: List.generate(
            6,
                (index) => const DataRow(
              cells: [
                DataCell(Text('2026-02-01')),
                DataCell(Text('فاتورة شراء')),
                DataCell(Text('+500')),
                DataCell(Text('12,500')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}