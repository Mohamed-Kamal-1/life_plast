import 'package:flutter/material.dart';

class RoleSummaryCard extends StatelessWidget {
  const RoleSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'ملخص الدور',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(),
            Text('الدور: مدير النظام'),
            SizedBox(height: 8),
            Text('عدد الصلاحيات: 24'),
            SizedBox(height: 8),
            Chip(label: Text('صلاحيات كاملة')),
          ],
        ),
      ),
    );
  }
}