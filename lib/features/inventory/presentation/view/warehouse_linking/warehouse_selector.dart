import 'package:flutter/material.dart';

class WarehouseSelector extends StatelessWidget {
  const WarehouseSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Text(
              'المخزن',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'main', child: Text('المخزن الرئيسي')),
                  DropdownMenuItem(value: 'branch', child: Text('مخزن الفرع')),
                ],
                onChanged: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}