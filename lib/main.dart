import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app_theme/app_theme.dart';
import 'features/inventory/presentation/view_model/inventory_provider.dart';
import 'features/logic/inventory_provider.dart';
import 'layout/main_layout.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => InventoryProvider(),
      child: const AccountingApp(),
    ),
  );
}

class AccountingApp extends StatelessWidget {
  const AccountingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainLayout(),
    );
  }
}
