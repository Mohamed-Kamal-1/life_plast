import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';
import 'package:flutter/material.dart';

import '../../ widgets/app_screen.dart';
import '../../ widgets/table_box.dart';
import '../../core/app_text/reports_text/reports_screen_text.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: ReportsScreenText.screenTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Filters
          Row(
            children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: ReportsScreenText.labelReportType),
                ),
              ),
              SizedBox(width: Dimension.widthSizeBox16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: ReportsScreenText.labelFromDate),
                ),
              ),
              SizedBox(width: Dimension.widthSizeBox16),
              Expanded(
                child: TextField(
                  decoration:
                      InputDecoration(labelText: ReportsScreenText.labelToDate),
                ),
              ),
            ],
          ),

          const SizedBox(height: Dimension.heightSizeBox20),

          /// Report Table
          TableBox(
            child: DataTable(
              columns: const [
                DataColumn(label: Text(ReportsScreenText.colStatement)),
                DataColumn(label: Text(ReportsScreenText.colValue)),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text(ReportsScreenText.totalSales)),
                  DataCell(Text('1,250,000')),
                ]),
                DataRow(cells: [
                  DataCell(Text(ReportsScreenText.totalPurchases)),
                  DataCell(Text('820,000')),
                ]),
                DataRow(cells: [
                  DataCell(Text(ReportsScreenText.netProfit)),
                  DataCell(Text('430,000')),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}