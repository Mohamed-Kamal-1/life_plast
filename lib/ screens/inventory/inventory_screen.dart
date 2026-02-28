import 'package:flutter/material.dart';
import '../../ widgets/app_screen.dart';
import '../../ widgets/table_box.dart';



class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: 'إدارة الأصناف',
      child: TableBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('كود')),
              DataColumn(label: Text('اسم الصنف')),
              DataColumn(label: Text('التصنيف')),
              DataColumn(label: Text('الوحدة')),
              DataColumn(label: Text('الكمية الحالية')),
              DataColumn(label: Text('حد إعادة الطلب')),
              DataColumn(label: Text('تكلفة الوحدة')),
              DataColumn(label: Text('الحالة')),
            ],
            rows: const [
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