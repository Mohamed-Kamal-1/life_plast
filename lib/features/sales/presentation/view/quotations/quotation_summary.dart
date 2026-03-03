import 'package:flutter/material.dart';
import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';

class QuotationSummary extends StatelessWidget {
  static const String _title = 'ملخص العرض';
  static const String _labelTotal = 'الإجمالي';
  static const String _labelDiscount = 'خصم';
  static const String _labelNet = 'الصافي';
  static const String _statusOpen = 'عرض مفتوح';

  const QuotationSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isMobile = screenWidth < 1100;

    return Card(
      margin: isMobile ? EdgeInsets.zero : const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(Dimension.padding12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(_title, style: TextStyle(fontWeight: FontWeight.bold)),
            Divider(),
            _Row(_labelTotal, '10,000'),
            _Row(_labelDiscount, '0'),
            Divider(),
            _Row(_labelNet, '10,000'),
            SizedBox(height: Dimension.heightSizeBox12),
            Chip(label: Text(_statusOpen)),
          ],
        ),
      ),
    );
  }
}

// كلاس _Row المساعد (بدون تغيير في الأساس)
class _Row extends StatelessWidget {
  final String label;
  final String value;
  const _Row(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimension.padding4),
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