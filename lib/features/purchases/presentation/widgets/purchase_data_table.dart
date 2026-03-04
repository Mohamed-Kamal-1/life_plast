import 'package:flutter/material.dart';

class PurchaseDataTable extends StatelessWidget {
  final Color headerColor;
  const PurchaseDataTable({super.key, required this.headerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: MediaQuery.sizeOf(context).width - 32),
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(headerColor),
            columns: const [
              DataColumn(label: Text('الصنف')),
              DataColumn(label: Text('الكمية')),
              DataColumn(label: Text('السعر')),
              DataColumn(label: Text('الإجمالي')),
              DataColumn(label: Text('حذف')),
            ],
            rows: const [],
          ),
        ),
      ),
    );
  }
}