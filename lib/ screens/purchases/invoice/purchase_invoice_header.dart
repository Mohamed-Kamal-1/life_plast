import 'package:flutter/material.dart';

import '../../inventory/warehouse_linking/warehouse_balance_card.dart';
import '../../inventory/warehouse_linking/warehouse_selector.dart';

class PurchaseInvoiceHeader extends StatelessWidget {
  const PurchaseInvoiceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _HeaderField('رقم الفاتورة', enabled: false),
            _HeaderField('التاريخ'),
            _HeaderField('المورد'),
            _HeaderField('المخزن'),
            _HeaderField('طريقة الدفع'),
            _HeaderField('رقم فاتورة المورد'),
            _HeaderField('ملاحظات', width: 420),
            WarehouseSelector(),
            WarehouseBalanceCard(),
          ],
        ),
      ),
    );
  }
}

class _HeaderField extends StatelessWidget {
  final String label;
  final bool enabled;
  final double width;

  const _HeaderField(
      this.label, {
        this.enabled = true,
        this.width = 220,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}