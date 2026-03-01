import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String message;

  const EmptyState({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline,
            size: 48,
            color: Colors.grey.shade500,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}