import 'package:flutter/material.dart';

import '../ widgets/app_screen.dart';

class AppFrom extends StatelessWidget {
  final String title;
  final Widget child;

  const AppFrom({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: title,
      child: Center(child: child),
    );
  }
}
