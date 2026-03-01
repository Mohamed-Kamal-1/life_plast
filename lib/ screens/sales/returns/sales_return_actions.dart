import 'package:flutter/material.dart';

class SalesReturnActions extends StatelessWidget {
  const SalesReturnActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: const Text('إلغاء'),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.undo),
          label: const Text('تنفيذ المرتجع'),
        ),
      ],
    );
  }
}