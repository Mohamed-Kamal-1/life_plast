import 'package:flutter/material.dart';

class SupplierPaymentsTable extends StatelessWidget {
  const SupplierPaymentsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('رقم السند')),
            DataColumn(label: Text('التاريخ')),
            DataColumn(label: Text('المورد')),
            DataColumn(label: Text('الطريقة')),
            DataColumn(label: Text('المبلغ')),
            DataColumn(label: Text('الحالة')),
            DataColumn(label: Text('')),
          ],
          rows: List.generate(
            6,
                (index) => const DataRow(
              cells: [
                DataCell(Text('SP-1001')),
                DataCell(Text('2026-02-01')),
                DataCell(Text('شركة توريدات')),
                DataCell(Text('تحويل بنكي')),
                DataCell(Text('15,000')),
                DataCell(Chip(label: Text('مرحل'))),
                DataCell(Icon(Icons.print)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}