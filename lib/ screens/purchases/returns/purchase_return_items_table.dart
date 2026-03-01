import 'package:flutter/material.dart';

class PurchaseReturnItemsTable extends StatelessWidget {
  const PurchaseReturnItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('الصنف')),
        DataColumn(label: Text('الكمية المشتراة')),
        DataColumn(label: Text('الكمية المرتجعة')),
        DataColumn(label: Text('السعر')),
        DataColumn(label: Text('الإجمالي')),
      ],
      rows: List.generate(
        3,
            (index) => DataRow(
          cells: const [
            DataCell(Text('خام')),
            DataCell(Text('20')),
            DataCell(
              SizedBox(
                width: 80,
                child: TextField(),
              ),
            ),
            DataCell(Text('30')),
            DataCell(Text('0')),
          ],
        ),
      ),
    );
  }
}