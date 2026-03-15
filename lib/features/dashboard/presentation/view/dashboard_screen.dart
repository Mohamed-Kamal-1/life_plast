import 'package:accounting_desktop/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../widgets/dashboard_header.dart';
import '../widgets/responsive_stats_grid.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DashboardHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "إحصائيات اليوم",
                      style:  context.fonts.titleMedium,
                    ),
                    const SizedBox(height: 15),
                    const ResponsiveStatsGrid(),
                    const SizedBox(height: 30),
                   Text("إحصائيات الشهر الحالي",style: context.fonts.titleMedium,),
                    const SizedBox(height: 15),
                    const ResponsiveStatsGrid(),
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
