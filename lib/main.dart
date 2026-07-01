import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_theme/app_theme.dart';
import 'core/di/di.dart';
import 'core/di/my_bloc_observer.dart';
import 'layout/main_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  Bloc.observer = MyBlocObserver();
  runApp(
    const AccountingApp(),
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
