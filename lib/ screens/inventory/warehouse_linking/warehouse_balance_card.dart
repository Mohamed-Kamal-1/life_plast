import 'package:flutter/material.dart';

class WarehouseBalanceCard extends StatelessWidget {
  const WarehouseBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'رصيد المخزن',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(),
            _Row('إجمالي الكمية', '25,000'),
            _Row('المتاح', '18,500'),
            _Row('محجوز', '6,500'),
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