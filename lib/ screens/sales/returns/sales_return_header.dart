import 'package:flutter/material.dart';

class SalesReturnHeader extends StatelessWidget {
  const SalesReturnHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: const [
        _HeaderField(label: 'رقم فاتورة البيع'),
        _HeaderField(label: 'تاريخ المرتجع'),
        _HeaderField(label: 'العميل'),
        _HeaderField(label: 'المخزن'),
        _HeaderField(label: 'سبب المرتجع', width: 400),
      ],
    );
  }
}

class _HeaderField extends StatelessWidget {
  final String label;
  final double width;

  const _HeaderField({
    required this.label,
    this.width = 220,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}