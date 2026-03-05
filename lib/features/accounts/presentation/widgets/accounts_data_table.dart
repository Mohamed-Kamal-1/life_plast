import 'package:flutter/material.dart';

class AccountsDataTable extends StatelessWidget {
  final List<String> columns;
  final Color headerColor;

  const AccountsDataTable({
    super.key,
    required this.columns,
    required this.headerColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: MediaQuery.sizeOf(context).width - 32),
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(headerColor),
            columns: columns.map((col) => DataColumn(
                label: Text(col, style: const TextStyle(fontWeight: FontWeight.bold))
            )).toList(),
            rows: const [], // سيتم ربطها بالـ Database لاحقاً
          ),
        ),
      ),
    );
  }
}