import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/di/di.dart';
import 'layout/main_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qskkxcuylefaxlqgpsnh.supabase.co', // حط رابط مشروعك
    publishableKey:
        'sb_publishable_MJB1LPjSks55efzlOumz9g__6X_yuRx', // حط الـ Key بتاع مشروعك
  );
  configureDependencies();
  runApp(const AccountingApp());
}

class AccountingApp extends StatelessWidget {
  const AccountingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Plast ERP',
      home: const MainLayout(),
    );
  }
}
