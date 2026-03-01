import 'package:flutter/material.dart';

class SupplierPaymentSummary extends StatelessWidget {
  const SupplierPaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'ملخص المورد',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(),
            _Row('إجمالي الفواتير', '120,000'),
            _Row('إجمالي المدفوع', '85,000'),
            Divider(),
            _Row('الرصيد المتبقي', '35,000'),
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
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}