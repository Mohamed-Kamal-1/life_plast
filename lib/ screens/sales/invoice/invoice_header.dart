import 'package:flutter/material.dart';

import '../../../core/dimensions/Dimension_app.dart';
import '../../inventory/warehouse_linking/warehouse_balance_card.dart';
import '../../inventory/warehouse_linking/warehouse_selector.dart';

class InvoiceHeader extends StatelessWidget {
  static const String _invNumber = 'رقم الفاتورة';
  static const String _invDate = 'التاريخ';
  static const String _customer = 'العميل';
  static const String _salesman = 'المندوب';
  static const String _warehouse = 'المخزن';
  static const String _paymentMethod = 'طريقة الدفع';
  static const String _notes = 'ملاحظات';

  const InvoiceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimension.padding12),
        child: Wrap(
          spacing: Dimension.padding12,
          runSpacing: Dimension.padding12,
          children: const [
            _Field(_invNumber, enabled: false),
            _Field(_invDate),
            _Field(_customer),
            _Field(_salesman),
            _Field(_warehouse),
            _Field(_paymentMethod),
            _Field(_notes, width: Dimension.width420),
            WarehouseSelector(),
            WarehouseBalanceCard(),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final bool enabled;
  final double width;

  const _Field(
    this.label, {
    this.enabled = true,
    this.width = Dimension.width220,
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