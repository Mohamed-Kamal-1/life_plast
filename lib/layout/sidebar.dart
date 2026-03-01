import 'package:accounting_desktop/core/colors/app_color.dart';
import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_text/sidebar_text.dart';
import 'navigation_controller.dart';
import 'sidebar_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationController>();
    final bool isMobile = MediaQuery.of(context).size.width < 1000;

    return Container(
      width: Dimension.widthSidebar260,
      color: AppColor.sidebarColor,
      child: Column(
        children: [
          const SizedBox(height: Dimension.heightSizeBox24),
          // جزء علوي اختياري للوجو
          const Icon(Icons.account_balance, size: 40, color: Colors.white),
          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: [
                SidebarItem(
                  title: SidebarText.dashboard,
                  icon: Icons.dashboard,
                  isActive: nav.currentScreen == AppScreen.dashboard,
                  onTap: () => _handleTap(context, nav, AppScreen.dashboard, isMobile),
                ),
                SidebarItem(
                  title: SidebarText.sales,
                  icon: Icons.receipt_long,
                  isActive: nav.currentScreen == AppScreen.sales,
                  onTap: () => _handleTap(context, nav, AppScreen.sales, isMobile),
                ),
                SidebarItem(
                  title: SidebarText.purchases,
                  icon: Icons.shopping_cart,
                  isActive: nav.currentScreen == AppScreen.purchases,
                  onTap: () => _handleTap(context, nav, AppScreen.purchases, isMobile),
                ),
                SidebarItem(
                  title: SidebarText.inventory,
                  icon: Icons.inventory,
                  isActive: nav.currentScreen == AppScreen.inventory,
                  onTap: () => _handleTap(context, nav, AppScreen.inventory, isMobile),
                ),
                SidebarItem(
                  title: SidebarText.accounts,
                  icon: Icons.account_balance,
                  isActive: nav.currentScreen == AppScreen.accounts,
                  onTap: () => _handleTap(context, nav, AppScreen.accounts, isMobile),
                ),
                SidebarItem(
                  title: SidebarText.employees,
                  icon: Icons.people,
                  isActive: nav.currentScreen == AppScreen.employees,
                  onTap: () => _handleTap(context, nav, AppScreen.employees, isMobile),
                ),
                Divider(color: Colors.white.withValues(alpha: 0.1)),
                SidebarItem(
                  title: SidebarText.reports,
                  icon: Icons.bar_chart,
                  isActive: nav.currentScreen == AppScreen.reports,
                  onTap: () => _handleTap(context, nav, AppScreen.reports, isMobile),
                ),
                SidebarItem(
                  title: SidebarText.profitLoss,
                  icon: Icons.trending_up,
                  isActive: nav.currentScreen == AppScreen.profitLoss,
                  onTap: () => _handleTap(context, nav, AppScreen.profitLoss, isMobile),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ميثود داخلية للتعامل مع الضغط وغلق المنيو في الموبايل
  void _handleTap(BuildContext context, NavigationController nav, AppScreen screen, bool isMobile) {
    nav.changeScreen(screen);
    if (isMobile) {
      nav.scaffoldKey.currentState?.closeDrawer();
    }
  }
}