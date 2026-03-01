import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';
import 'package:flutter/material.dart';

import '../../ widgets/app_screen.dart';
import '../../ widgets/stat_card.dart';
import '../../ widgets/table_box.dart';
import '../../core/app_text/dashboard_text/dashboard_screen_text.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على عرض الشاشة الحالي
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;;

    return AppScreen(
      title: DashboardScreenText.title,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimension.padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Section
            const Text(
              DashboardScreenText.companyName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              DashboardScreenText.systemSubtitle,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: Dimension.heightSizeBox24),

            /// KPI Cards Section (GridView للحفاظ على التناسق)
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;
                double aspectRatio = constraints.maxWidth < 600 ? 1.4 : 2.2;

                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: Dimension.widthSizeBox16,
                  mainAxisSpacing: Dimension.heightSizeBox16,
                  childAspectRatio: aspectRatio,
                  children: const [
                    StatCard(
                        title: DashboardScreenText.totalSales,
                        value: '1,250,000'),
                    StatCard(
                        title: DashboardScreenText.totalPurchases,
                        value: '820,000'),
                    StatCard(
                        title: DashboardScreenText.inventoryValue,
                        value: '2,100,000'),
                    StatCard(
                        title: DashboardScreenText.itemsCount, value: '148'),
                  ],
                );
              },
            ),

            const SizedBox(height: Dimension.heightSizeBox32),

            /// Inventory Section Header
            const Text(
              DashboardScreenText.inventorySummary,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: Dimension.heightSizeBox12),

            /// Inventory Table - هنا حل مشكلة الموبايل
            TableBox(
              child: Container(
                // بنجبر الحاوية تاخد عرض الشاشة المتاح عشان متضربش في الموبايل
                width: screenWidth - (Dimension.padding16 * 2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  // الـ Scroll العرضي هو اللي بيحمي الجدول في الشاشات الضيقة
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      // بنحدد أقل عرض للجدول عشان الداتا متتحشرش فوق بعضها
                      minWidth: screenWidth < 600 ? 800 : screenWidth - 64,
                      maxHeight: screenHeight < 600 ? 300 : screenHeight - 64,
                    ),
                    child: DataTable(
                      headingRowColor:
                          WidgetStateProperty.all(Colors.grey[100]),
                      columnSpacing: 20, // تقليل المسافات بين الأعمدة للموبايل
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}