import 'package:flutter/material.dart';

class InvoiceItemsTable extends StatelessWidget {
  const InvoiceItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('كود')),
            DataColumn(label: Text('الصنف')),
            DataColumn(label: Text('وحدة')),
            DataColumn(label: Text('كمية')),
            DataColumn(label: Text('سعر')),
            DataColumn(label: Text('خصم %')),
            DataColumn(label: Text('ضريبة %')),
            DataColumn(label: Text('إجمالي')),
            DataColumn(label: Text('')),
          ],
          rows: List.generate(6, (index) {
            return const DataRow(
              cells: [
                DataCell(Text('IT-01')),
                DataCell(Text('منتج بلاستيك')),
                DataCell(Text('قطعة')),
                DataCell(TextField()),
                DataCell(TextField()),
                DataCell(TextField()),
                DataCell(TextField()),
                DataCell(Text('1,250')),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ],
            );
          }),
        ),
      ),
    );
  }
}