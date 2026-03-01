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
        child: LayoutBuilder(
          builder: (context, constraints) {
            // تحديد إذا كانت الشاشة موبايل (أصغر من 800 بكسل مثلاً)
            bool isMobile = constraints.maxWidth < 800;

            return Scaffold(
              // في الموبايل، الـ Sidebar بيبقى Drawer
              drawer: isMobile ? const Drawer(child: Sidebar()) : null,

              // التوب بار بنضيف له زرار القائمة (Menu Icon) لو إحنا في الموبايل
              appBar: isMobile
                  ? AppBar(
                title: const TopBar(), // ممكن تحط التوب بار هنا أو تدمجه
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              )
                  : null,

              body: Row(
                children: [
                  // لو ديسكتوب، اعرض الـ Sidebar ثابت
                  if (!isMobile) const Sidebar(),

                  Expanded(
                    child: Column(
                      children: [
                        // لو ديسكتوب، اعرض التوب بار العادي بتاعك
                        if (!isMobile) const TopBar(),

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
            );
          },
        ),
      ),
    );
  }
}