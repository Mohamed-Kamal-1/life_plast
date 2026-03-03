import 'package:flutter/material.dart';

class QuotationItemsTable extends StatelessWidget {
  const QuotationItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('كود')),
              DataColumn(label: Text('الصنف')),
              DataColumn(label: Text('كمية')),
              DataColumn(label: Text('سعر')),
              DataColumn(label: Text('إجمالي')),
            ],
            rows: List.generate(5, (index) {
              return const DataRow(
                cells: [
                  DataCell(Text('IT-02')),
                  DataCell(Text('منتج بلاستيك')),
                  DataCell(SizedBox(width: 80, child: TextField(decoration: InputDecoration(isDense: true)))),
                  DataCell(SizedBox(width: 80, child: TextField(decoration: InputDecoration(isDense: true)))),
                  DataCell(Text('2,000')),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}