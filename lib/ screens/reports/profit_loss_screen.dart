import 'package:flutter/material.dart';
import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';
import '../../ widgets/action_button.dart';
import '../../ widgets/app_screen.dart';
import '../../ widgets/table_box.dart';
import '../../core/app_text/profit_and_Loss_text/profit_and_Loss_screen_text.dart';

class ProfitLossScreen extends StatelessWidget {
  const ProfitLossScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: ProfitLossScreenText.screenTitle,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Filters
            Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: ProfitLossScreenText.labelFromDate),
                  ),
                ),
                SizedBox(width: Dimension.widthSizeBox16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: ProfitLossScreenText.labelToDate),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimension.heightSizeBox16),
            const ActionButton(
              title: ProfitLossScreenText.btnCalculate,
              icon: Icons.calculate,
            ),

            const SizedBox(height: Dimension.heightSizeBox24),

            /// Summary
            TableBox(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text(ProfitLossScreenText.colItem)),
                  DataColumn(label: Text(ProfitLossScreenText.colValue)),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text(ProfitLossScreenText.totalSales)),
                    DataCell(Text('1,250,000')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(ProfitLossScreenText.totalPurchases)),
                    DataCell(Text('820,000')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(ProfitLossScreenText.expenses)),
                    DataCell(Text('150,000')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(ProfitLossScreenText.netProfit)),
                    DataCell(Text('280,000')),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}