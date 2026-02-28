import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_controller.dart';
import 'sidebar.dart';
import 'topbar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationController(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Row(
            children: [
              const Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    const TopBar(),
                    Expanded(
                      child: Consumer<NavigationController>(
                        builder: (context, nav, _) {
                          return nav.currentWidget;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}