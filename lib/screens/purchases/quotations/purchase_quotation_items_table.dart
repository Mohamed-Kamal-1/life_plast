import 'package:flutter/material.dart';

class PurchaseQuotationItemsTable extends StatelessWidget {
  const PurchaseQuotationItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('كود')),
            DataColumn(label: Text('الصنف')),
            DataColumn(label: Text('كمية')),
            DataColumn(label: Text('سعر')),
            DataColumn(label: Text('إجمالي')),
          ],
          rows: List.generate(
            5,
                (index) => const DataRow(
              cells: [
                DataCell(Text('IT-11')),
                DataCell(Text('خامة')),
                DataCell(TextField()),
                DataCell(TextField()),
                DataCell(Text('5,000')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}