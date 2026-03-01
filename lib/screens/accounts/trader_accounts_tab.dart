import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ widgets/table_box.dart';
import '../../core/app_text/accounts_text/account_screen_text.dart';

class TraderAccountsTab extends StatelessWidget {
  const TraderAccountsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TableBox(
      child: DataTable(
        columns: const [
          DataColumn(label: Text(AccountsScreenText.colDate)),
          DataColumn(label: Text(AccountsScreenText.colProcess)),
          DataColumn(label: Text(AccountsScreenText.colDebit)),
          DataColumn(label: Text(AccountsScreenText.colCredit)),
          DataColumn(label: Text(AccountsScreenText.colBalance)),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('2024-02-10')),
            DataCell(Text('فاتورة بيع')),
            DataCell(Text('')),
            DataCell(Text('35,000')),
            DataCell(Text('35,000')),
          ]),
        ],
      ),
    );
  }
}