import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const AppScreen({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    final double responsivePadding = screenWidth < 600 ? 16.0 : 24.0;

    return Padding(
      padding: EdgeInsets.all(responsivePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 24),
          Expanded(child: child),
        ],
      ),
    );
  }
}