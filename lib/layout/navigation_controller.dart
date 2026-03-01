import 'package:flutter/material.dart';
import '../ screens/accounts/accounts_screen.dart';
import '../ screens/dashboard/dashboard_screen.dart';
import '../ screens/employees/employees_screen.dart';
import '../ screens/inventory/inventory_screen.dart';
import '../ screens/purchases/purchase_screen.dart';
import '../ screens/reports/profit_loss_screen.dart';
import '../ screens/reports/reports_screen.dart';

import '../ screens/sales/sales_screen.dart';

enum AppScreen {
  dashboard,
  sales,
  purchases,
  inventory,
  accounts,
  employees,
  reports,
  profitLoss,
}

class NavigationController extends ChangeNotifier {
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
      case AppScreen.sales:
        return const SalesScreen();
      case AppScreen.purchases:
        return const PurchasesScreen();
      case AppScreen.inventory:
        return const InventoryScreen();
      case AppScreen.accounts:
        return const AccountsScreen();
      case AppScreen.employees:
        return const EmployeesScreen();
      case AppScreen.reports:
        return const ReportsScreen();
      case AppScreen.profitLoss:
        return const ProfitLossScreen();
    }
  }
}
