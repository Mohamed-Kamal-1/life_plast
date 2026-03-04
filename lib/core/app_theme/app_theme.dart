// theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // scaffoldBackgroundColor: const Color(0xffF4F6F8),
    scaffoldBackgroundColor:  Colors.brown,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff1E293B),
    ),
    textTheme: TextTheme(
        titleLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        headlineSmall:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        titleMedium:
            GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 16)),
  );
}