import 'package:flutter/material.dart';

import '../features/accounts/presentation/view/accounts_screen.dar.dart';
import '../features/dashboard/presentation/view/dashboard_screen.dart';
import '../features/inventory/presentation/view/inventory_screen.dart';
import '../features/purchases/presentation/view/purchases_screen.dart';
import '../features/reports/view/reports_screen.dart';
import '../features/sales/presentation/view/sales_screen.dart';

enum AppScreen { dashboard, sales, purchases, inventory, accounts, employees, reports, profitLoss }

class NavigationController extends ChangeNotifier {
  // مفتاح التحكم في الـ Scaffold لفتح الـ Drawer في الموبايل
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AppScreen _currentScreen = AppScreen.dashboard;
  AppScreen get currentScreen => _currentScreen;

  void changeScreen(AppScreen screen) {
    if (_currentScreen == screen) return;
    _currentScreen = screen;
    notifyListeners();
  }

  Widget get currentWidget {
    switch (_currentScreen) {
      case AppScreen.dashboard:
        return const DashboardScreen();
      case AppScreen.sales: return const SalesScreen();
      case AppScreen.purchases: return const PurchasesScreen();
      case AppScreen.inventory: return const InventoryScreen();
      case AppScreen.accounts: return const AccountsScreen();
      case AppScreen.reports: return const ReportsScreen();
      default:
        return Container();
    }
  }
}