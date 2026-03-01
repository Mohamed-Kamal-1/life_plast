import 'package:flutter/material.dart';

class SalesReturnItemsTable extends StatelessWidget {
  const SalesReturnItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('الصنف')),
        DataColumn(label: Text('الكمية المباعة')),
        DataColumn(label: Text('الكمية المرتجعة')),
        DataColumn(label: Text('السعر')),
        DataColumn(label: Text('الإجمالي')),
      ],
      rows: List.generate(
        3,
            (index) => DataRow(
          cells: const [
            DataCell(Text('منتج')),
            DataCell(Text('10')),
            DataCell(
              SizedBox(
                width: 80,
                child: TextField(),
              ),
            ),
            DataCell(Text('50')),
            DataCell(Text('0')),
          ],
        ),
      ),
    );
  }
}