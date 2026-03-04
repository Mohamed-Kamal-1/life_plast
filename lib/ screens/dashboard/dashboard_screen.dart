import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';
import 'package:accounting_desktop/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../ widgets/stat_card.dart';
import '../../core/app_text/dashboard_text/dashboard_screen_text.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimension.padding20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // هيدر الصفحة
            Text(
              DashboardScreenText.companyName,
              style: context.fonts.headlineSmall,
            ),
            Text(DashboardScreenText.systemSubtitle),
            const SizedBox(height: Dimension.heightSizeBox30),

            // قسم الـ 24 ساعة
            const Text(
              DashboardScreenText.dailyStats,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                StatCard(
                    title: DashboardScreenText.inventoryValue,
                    value: "0.00 ج.م"),
                StatCard(title: DashboardScreenText.totalSales, value: "0"),
                StatCard(title: DashboardScreenText.salesReturns, value: "0"),
                StatCard(title: DashboardScreenText.totalPurchases, value: "0"),
                StatCard(
                    title: DashboardScreenText.purchaseReturns, value: "0"),
              ],
            ),

            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 20),

            // قسم الشهر
            const Text(
              DashboardScreenText.monthlyStats,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                StatCard(
                    title: DashboardScreenText.inventoryValue,
                    value: "0.00 ج.م"),
                StatCard(title: DashboardScreenText.totalSales, value: "0"),
                StatCard(title: DashboardScreenText.salesReturns, value: "0"),
                StatCard(title: DashboardScreenText.totalPurchases, value: "0"),
                StatCard(
                    title: DashboardScreenText.purchaseReturns, value: "0"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}