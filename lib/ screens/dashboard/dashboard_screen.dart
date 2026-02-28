import 'package:flutter/material.dart';

import '../../ widgets/app_screen.dart';
import '../../ widgets/stat_card.dart';
import '../../ widgets/table_box.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: 'لوحة التحكم',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Company Header
            const Text(
              'لايف بلاست للصناعات البلاستيكية',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'نظام إدارة الحسابات والمخزون',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            /// KPI Cards
            Row(
              children: const [
                StatCard(title: 'إجمالي المبيعات', value: '1,250,000'),
                SizedBox(width: 16),
                StatCard(title: 'إجمالي المشتريات', value: '820,000'),
                SizedBox(width: 16),
                StatCard(title: 'قيمة المخزون', value: '2,100,000'),
                SizedBox(width: 16),
                StatCard(title: 'عدد الأصناف', value: '148'),
              ],
            ),

            const SizedBox(height: 32),

            /// Inventory Snapshot
            const Text(
              'ملخص المخزون',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            TableBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('كود الصنف')),
                    DataColumn(label: Text('اسم الصنف')),
                    DataColumn(label: Text('التصنيف')),
                    DataColumn(label: Text('الكمية')),
                    DataColumn(label: Text('الحد الأدنى')),
                    DataColumn(label: Text('الوحدة')),
                    DataColumn(label: Text('الحالة')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('PL-1001')),
                      DataCell(Text('جردل بلاستيك 20 لتر')),
                      DataCell(Text('منتجات نهائية')),
                      DataCell(Text('5,200')),
                      DataCell(Text('1,000')),
                      DataCell(Text('قطعة')),
                      DataCell(Text('متاح')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('PL-2033')),
                      DataCell(Text('غطاء بلاستيك')),
                      DataCell(Text('نصف مصنع')),
                      DataCell(Text('800')),
                      DataCell(Text('1,200')),
                      DataCell(Text('قطعة')),
                      DataCell(Text('قارب على النفاد')),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
