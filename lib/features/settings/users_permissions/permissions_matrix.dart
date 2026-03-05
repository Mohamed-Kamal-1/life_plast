import 'package:flutter/material.dart';

class PermissionsMatrix extends StatelessWidget {
  const PermissionsMatrix({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('الشاشة')),
          DataColumn(label: Text('عرض')),
          DataColumn(label: Text('إضافة')),
          DataColumn(label: Text('تعديل')),
          DataColumn(label: Text('حذف')),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('المبيعات')),
            DataCell(Checkbox(value: true, onChanged: null)),
            DataCell(Checkbox(value: true, onChanged: null)),
            DataCell(Checkbox(value: false, onChanged: null)),
            DataCell(Checkbox(value: false, onChanged: null)),
          ]),
          DataRow(cells: [
            DataCell(Text('المشتريات')),
            DataCell(Checkbox(value: true, onChanged: null)),
            DataCell(Checkbox(value: false, onChanged: null)),
            DataCell(Checkbox(value: false, onChanged: null)),
            DataCell(Checkbox(value: false, onChanged: null)),
          ]),
        ],
      ),
    );
  }
}