import 'package:flutter/material.dart';

class SalesReturnItemsTable extends StatelessWidget {
  const SalesReturnItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // الحل الجذري للموبايل
          child: DataTable(
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
                      child: TextField(
                        decoration: InputDecoration(isDense: true),
                      ),
                    ),
                  ),
                  DataCell(Text('50')),
                  DataCell(Text('0')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}