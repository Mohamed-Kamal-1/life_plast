import 'package:flutter/material.dart';

class PurchaseQuotationSummary extends StatelessWidget {
  const PurchaseQuotationSummary({super.key});

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
            _SummaryRow('الإجمالي', '5,000'),
            Divider(),
            _SummaryRow('الصافي', '5,000'),
            SizedBox(height: 12),
            Chip(label: Text('قيد التفاوض')),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow(this.label, this.value);

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