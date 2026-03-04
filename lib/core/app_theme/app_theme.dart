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
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ),
  );
}