import 'package:flutter/material.dart';

class QuotationSummary extends StatelessWidget {
  const QuotationSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('ملخص العرض',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Divider(),
            _Row('الإجمالي', '10,000'),
            _Row('خصم', '0'),
            Divider(),
            _Row('الصافي', '10,000'),
            SizedBox(height: 12),
            Chip(label: Text('عرض مفتوح')),
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