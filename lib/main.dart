import 'package:flutter/material.dart';

import 'core/app_theme/app_theme.dart';
import 'layout/main_layout.dart';

void main() {
  runApp(const AccountingApp());
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
