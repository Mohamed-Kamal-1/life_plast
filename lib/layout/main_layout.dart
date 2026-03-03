import 'package:accounting_desktop/layout/sidebar.dart';
import 'package:accounting_desktop/layout/topbar.dart';
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
                // الشاشات أقل من 1000 تعتبر تابلت/موبايل
                bool isMobile = constraints.maxWidth < 1000;

                return SafeArea(
                  child: Scaffold(
                    key: nav.scaffoldKey,
                    // الدرور يظهر في الموبايل فقط
                    drawer: isMobile ? const AppDrawer() : null,
                    body: Row(
                      children: [
                        // السايد بار ثابت في الديسكتوب فقط
                        if (!isMobile) const Sidebar(),
                  
                        Expanded(
                          child: Column(
                            children: [
                              const TopBar(),
                              Expanded(
                                // تمت إزالة الـ AnimatedSwitcher ووضع المحتوى مباشرة
                                child: nav.currentWidget,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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