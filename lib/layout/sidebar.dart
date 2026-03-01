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

    return Container(
      width: Dimension.widthSidebar260,
      color: AppColor.sidebarColor,
      child: Column(
        children: [
          const SizedBox(height: Dimension.heightSizeBox24),
          SidebarItem(
            title: SidebarText.dashboard,
            icon: Icons.dashboard,
            isActive: nav.currentScreen == AppScreen.dashboard,
            onTap: () => nav.changeScreen(AppScreen.dashboard),
          ),
          SidebarItem(
            title: SidebarText.sales,
            icon: Icons.receipt_long,
            isActive: nav.currentScreen == AppScreen.sales,
            onTap: () => nav.changeScreen(AppScreen.sales),
          ),
          SidebarItem(
            title: SidebarText.purchases,
            icon: Icons.shopping_cart,
            isActive: nav.currentScreen == AppScreen.purchases,
            onTap: () => nav.changeScreen(AppScreen.purchases),
          ),
          SidebarItem(
            title: SidebarText.inventory,
            icon: Icons.inventory,
            isActive: nav.currentScreen == AppScreen.inventory,
            onTap: () => nav.changeScreen(AppScreen.inventory),
          ),
          SidebarItem(
            title: SidebarText.accounts,
            icon: Icons.account_balance,
            isActive: nav.currentScreen == AppScreen.accounts,
            onTap: () => nav.changeScreen(AppScreen.accounts),
          ),
          SidebarItem(
            title: SidebarText.employees,
            icon: Icons.people,
            isActive: nav.currentScreen == AppScreen.employees,
            onTap: () => nav.changeScreen(AppScreen.employees),
          ),
          const Divider(),
          SidebarItem(
            title: SidebarText.reports,
            icon: Icons.bar_chart,
            isActive: nav.currentScreen == AppScreen.reports,
            onTap: () => nav.changeScreen(AppScreen.reports),
          ),
          SidebarItem(
            title: SidebarText.profitLoss,
            icon: Icons.trending_up,
            isActive: nav.currentScreen == AppScreen.profitLoss,
            onTap: () => nav.changeScreen(AppScreen.profitLoss),
          ),
        ],
      ),
    );
  }
}
