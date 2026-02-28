import 'package:flutter/material.dart';

import '../../ widgets/action_button.dart';
import '../../ widgets/app_screen.dart';
import '../../ widgets/table_box.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: 'Purchase Invoice',
      child: Column(
        children: [
          /// Header
          Row(
            children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Supplier'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Invoice Date'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// Items Table
          TableBox(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Item')),
                DataColumn(label: Text('Qty')),
                DataColumn(label: Text('Cost')),
                DataColumn(label: Text('Total')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Pipe 3/4')),
                  DataCell(Text('50')),
                  DataCell(Text('40')),
                  DataCell(Text('2000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Elbow')),
                  DataCell(Text('100')),
                  DataCell(Text('8')),
                  DataCell(Text('800')),
                ]),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// Totals
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text('Subtotal: 2,800'),
                Text('Tax: 0'),
                Text(
                  'Total: 2,800',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: const [
              ActionButton(title: 'Save', icon: Icons.save),
              SizedBox(width: 12),
              ActionButton(title: 'Print', icon: Icons.print),
            ],
          )
        ],
      ),
    );
  }
}
