import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // تأكد من استدعاء الحزمة

import 'core/app_theme/app_theme.dart';
import 'core/di/di.dart';
import 'core/routes/app_routes.dart';

void main() async {
  // 1. تأكيد تهيئة ويدجت فلاتر قبل أي عملية خارجيّة
  WidgetsFlutterBinding.ensureInitialized();

  // 2. الكارثة التي كانت معطلة: يجب تهيئة السوبابيز أولاً قبل أي شيء
  await Supabase.initialize(
    url: 'https://qskkxcuylefaxlqgpsnh.supabase.co',
    publishableKey:
        'sb_publishable_MJB1LPjSks55efzlOumz9g__6X_yuRx', // استبدله بالـ Anon Key الخاص بمشروعك
  );

  // 3. تهيئة حقن الاعتماديات (Injectable) بعد ربط قاعدة البيانات
  configureDependencies();

  runApp(const AccountingApp());
}

class AccountingApp extends StatelessWidget {
  const AccountingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Life Plast',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      // توجيه التطبيق بالكامل لنظام المسارات المستقل
      routerConfig: AppRouter.router,
    );
  }
}
