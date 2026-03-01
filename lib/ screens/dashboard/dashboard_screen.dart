import 'package:flutter/material.dart';

import '../../ widgets/app_screen.dart';
import '../../ widgets/stat_card.dart';
import '../../ widgets/table_box.dart';
import '../../core/app_text/dashboard_text/dashboard_screen_text.dart';

// تأكد من استيراد الملف اللي فيه الكلاس ده لو كان في ملف منفصل
// import 'path_to_your_text_file/dashboard_screen_text.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: DashboardScreenText.title, // تم التغيير
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Company Header
            const Text(
              DashboardScreenText.companyName, // تم التغيير
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              DashboardScreenText.systemSubtitle,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            /// KPI Cards
            Row(
              children: const [
                StatCard(
                  title: DashboardScreenText.totalSales,
                  value: '1,250,000',
                ),
                SizedBox(width: 16),
                StatCard(
                  title: DashboardScreenText.totalPurchases,
                  value: '820,000',
                ),
                SizedBox(width: 16),
                StatCard(
                  title: DashboardScreenText.inventoryValue,
                  value: '2,100,000',
                ),
                SizedBox(width: 16),
                StatCard(
                  title: DashboardScreenText.itemsCount,
                  value: '148',
                ),
              ],
            ),

            const SizedBox(height: 32),

            /// Inventory Snapshot
            const Text(
              DashboardScreenText.inventorySummary,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            TableBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text(DashboardScreenText.itemCode)),
                    DataColumn(label: Text(DashboardScreenText.itemName)),
                    DataColumn(label: Text(DashboardScreenText.category)),
                    DataColumn(label: Text(DashboardScreenText.quantity)),
                    DataColumn(label: Text(DashboardScreenText.minLimit)),
                    DataColumn(label: Text(DashboardScreenText.unit)),
                    DataColumn(label: Text(DashboardScreenText.status)),
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