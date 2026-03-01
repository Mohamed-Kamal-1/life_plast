import 'package:flutter/material.dart';

class InvoiceItemsTable extends StatelessWidget {

  static const String _colCode = 'كود';
  static const String _colName = 'الصنف';
  static const String _colUnit = 'وحدة';
  static const String _colQty = 'كمية';
  static const String _colPrice = 'سعر';
  static const String _colDiscount = 'خصم %';
  static const String _colTax = 'ضريبة %';
  static const String _colTotal = 'إجمالي';

  const InvoiceItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text(_colCode)),
            DataColumn(label: Text(_colName)),
            DataColumn(label: Text(_colUnit)),     
            DataColumn(label: Text(_colQty)),
            DataColumn(label: Text(_colPrice)),
            DataColumn(label: Text(_colDiscount)),
            DataColumn(label: Text(_colTax)),
            DataColumn(label: Text(_colTotal)),
            DataColumn(label: Text('')), // عمود الحذف
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