import 'package:flutter/material.dart';

class PurchaseItemsTable extends StatelessWidget {
  const PurchaseItemsTable({super.key});

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
            DataColumn(label: Text('سعر شراء')),
            DataColumn(label: Text('ضريبة %')),
            DataColumn(label: Text('إجمالي')),
            DataColumn(label: Text('')),
          ],
          rows: List.generate(
            6,
                (index) => const DataRow(
              cells: [
                DataCell(Text('IT-10')),
                DataCell(Text('خامة بلاستيك')),
                DataCell(Text('كيلو')),
                DataCell(TextField()),
                DataCell(TextField()),
                DataCell(TextField()),
                DataCell(Text('8,500')),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}