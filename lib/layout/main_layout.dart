import 'package:accounting_desktop/layout/sidebar.dart';
import 'package:accounting_desktop/layout/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mobile_drawer.dart';
import 'navigation_controller.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationController(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<NavigationController>(
          builder: (context, nav, _) {
            return LayoutBuilder(
              builder: (context, constraints) {
                // تحديد نوع الشاشة بناءً على العرض
                bool isMobile = constraints.maxWidth < 1000;

                return Scaffold(
                  key: nav.scaffoldKey, // تأكد من إضافة هذا الحقل في NavigationController
                  drawer: isMobile ? const AppDrawer() : null,
                  body: Row(
                    children: [
                      if (!isMobile) const Sidebar(),
                      Expanded(
                        child: Column(
                          children: [
                            const TopBar(),
                            Expanded(
                              child: nav.currentWidget,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}