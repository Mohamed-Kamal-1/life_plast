import 'package:flutter/material.dart';

class SupplierPaymentForm extends StatelessWidget {
  const SupplierPaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _Field('رقم السند', enabled: false),
            _Field('التاريخ'),
            _Field('المورد'),
            _Field('طريقة الدفع'),
            _Field('رقم المرجع'),
            _Field('المبلغ'),
            _Field('ملاحظات', width: 420),
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