import 'package:flutter/material.dart';

class InvoiceSummary extends StatelessWidget {
  const InvoiceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('ملخص الفاتورة',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Divider(),
            _Row('إجمالي', '12,500'),
            _Row('خصم', '500'),
            _Row('ضريبة', '1,200'),
            Divider(),
            _Row('الصافي', '13,200'),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;

  const _Row(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(label),
          const Spacer(),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}