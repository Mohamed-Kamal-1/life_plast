import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvoiceItemsTable extends StatelessWidget {
  const InvoiceItemsTable({super.key});
  // ... (النصوص كما هي)
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, // تمرير رأسي
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // تمرير أفقي للموبايل
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
                  DataCell(SizedBox(width: 60, child: TextField())),
                  DataCell(SizedBox(width: 60, child: TextField())),
                  DataCell(SizedBox(width: 60, child: TextField())),
                  DataCell(SizedBox(width: 60, child: TextField())),
                  DataCell(Text('1,250')),
                  DataCell(Icon(Icons.delete, color: Colors.red)),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}