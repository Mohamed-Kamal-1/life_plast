import 'package:flutter/material.dart';
import '../../ widgets/app_screen.dart';
import '../../ widgets/table_box.dart';
import '../../core/app_text/inventory_text/inventory_screen_text.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: InventoryScreenText.screenTitle, // تم التغيير
      child: TableBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text(InventoryScreenText.colCode)),         // تم التغيير
              DataColumn(label: Text(InventoryScreenText.colName)),         // تم التغيير
              DataColumn(label: Text(InventoryScreenText.colCategory)),     // تم التغيير
              DataColumn(label: Text(InventoryScreenText.colUnit)),         // تم التغيير
              DataColumn(label: Text(InventoryScreenText.colCurrentQty)),   // تم التغيير
              DataColumn(label: Text(InventoryScreenText.colReorderLevel)), // تم التغيير
              DataColumn(label: Text(InventoryScreenText.colUnitCost)),     // تم التغيير
              DataColumn(label: Text(InventoryScreenText.colStatus)),       // تم التغيير
            ],
            rows: const [
              // البيانات دي مثال وهتتربط لاحقاً بالـ Database
              DataRow(cells: [
                DataCell(Text('PL-1001')),
                DataCell(Text('جردل بلاستيك 20 لتر')),
                DataCell(Text('منتج نهائي')),
                DataCell(Text('قطعة')),
                DataCell(Text('5,200')),
                DataCell(Text('1,000')),
                DataCell(Text('22')),
                DataCell(Text('نشط')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}