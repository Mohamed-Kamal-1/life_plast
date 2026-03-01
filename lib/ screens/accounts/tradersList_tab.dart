import 'package:flutter/material.dart';

import '../../ widgets/table_box.dart';
import '../../core/app_text/accounts_text/account_screen_text.dart';

class TradersListTab extends StatelessWidget {
  const TradersListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TableBox(
      child: DataTable(
        columns: const [
          DataColumn(label: Text(AccountsScreenText.colName)),
          DataColumn(label: Text(AccountsScreenText.colType)),
          DataColumn(label: Text(AccountsScreenText.colPhone)),
          DataColumn(label: Text(AccountsScreenText.colCity)),
          DataColumn(label: Text(AccountsScreenText.colStatus)),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('شركة النور')),
            DataCell(Text('عميل')),
            DataCell(Text('0100000000')),
            DataCell(Text('القاهرة')),
            DataCell(Text('نشط')),
          ]),
        ],
      ),
    );
  }
}
