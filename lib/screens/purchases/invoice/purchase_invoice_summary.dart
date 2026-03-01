import 'package:flutter/material.dart';

class PurchaseInvoiceSummary extends StatelessWidget {
  const PurchaseInvoiceSummary({super.key});

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
            _SummaryRow('إجمالي', '8,500'),
            _SummaryRow('ضريبة', '1,020'),
            Divider(),
            _SummaryRow('الصافي', '9,520'),
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