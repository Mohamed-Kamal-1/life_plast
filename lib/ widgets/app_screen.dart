import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const AppScreen({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
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