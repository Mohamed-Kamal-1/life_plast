import 'package:flutter/material.dart';
import 'package:accounting_desktop/core/dimensions/Dimension_app.dart'; // تأكد من المسار الصحيح
import '../../ widgets/action_button.dart';
import '../../ widgets/app_screen.dart';
import '../../ widgets/table_box.dart';
import '../../core/app_text/purchases_text/purchases_screen_text.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: PurchasesScreenText.screenTitle,
      child: Column(
        children: [
          /// Header
          Row(
            children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: PurchasesScreenText.supplier,
                  ),
                ),
              ),
              SizedBox(width: Dimension.widthSizeBox16), // تم استخدام Dimension
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: PurchasesScreenText.invoiceDate,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: Dimension.heightSizeBox20), // تم استخدام Dimension

          /// Items Table
          TableBox(
            child: DataTable(
              columns: const [
                DataColumn(label: Text(PurchasesScreenText.columnItem)),
                DataColumn(label: Text(PurchasesScreenText.columnQty)),
                DataColumn(label: Text(PurchasesScreenText.columnCost)),
                DataColumn(label: Text(PurchasesScreenText.columnTotal)),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Pipe 3/4')),
                  DataCell(Text('50')),
                  DataCell(Text('40')),
                  DataCell(Text('2000')),
                ]),
              ],
            ),
          ),

          const SizedBox(height: Dimension.heightSizeBox20), // تم استخدام Dimension

          /// Totals
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text('${PurchasesScreenText.subtotal}: 2,800'),
                Text('${PurchasesScreenText.tax}: 0'),
                Text(
                  '${PurchasesScreenText.grandTotal}: 2,800',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: Dimension.heightSizeBox20), // تم استخدام Dimension

          /// Buttons Action
          Row(
            children: const [
              ActionButton(
                title: PurchasesScreenText.btnSave,
                icon: Icons.save,
              ),
              SizedBox(width: Dimension.widthSizeBox12), // تم استخدام Dimension
              ActionButton(
                title: PurchasesScreenText.btnPrint,
                icon: Icons.print,
              ),
            ],
          )
        ],
      ),
    );
  }
}