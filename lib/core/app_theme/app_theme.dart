// theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // scaffoldBackgroundColor: const Color(0xffF4F6F8),
    scaffoldBackgroundColor:  Colors.brown,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff1E293B),
    ),
    textTheme: TextTheme(
        titleLarge:  TextStyle(fontWeight: FontWeight.bold, fontSize: 22,fontFamily: 'assets/fonts/Cairo-Regular.ttf'),
        headlineSmall:
             TextStyle(fontWeight: FontWeight.bold, fontSize: 24,fontFamily: 'assets/fonts/Cairo-Regular.ttf'),
        titleMedium:
           TextStyle(fontWeight: FontWeight.bold, fontSize: 16,fontFamily: 'assets/fonts/Cairo-Regular.ttf')),
  );
}