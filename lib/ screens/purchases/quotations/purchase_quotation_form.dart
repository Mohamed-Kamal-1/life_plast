import 'package:flutter/material.dart';

class PurchaseQuotationForm extends StatelessWidget {
  const PurchaseQuotationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _FormField('رقم العرض', enabled: false),
            _FormField('تاريخ العرض'),
            _FormField('المورد'),
            _FormField('تاريخ الصلاحية'),
            _FormField('ملاحظات', width: 420),
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final bool enabled;
  final double width;

  const _FormField(
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