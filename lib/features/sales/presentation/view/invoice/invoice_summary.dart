import 'package:flutter/material.dart';
import '../../../../../core/dimensions/Dimension_app.dart';


class InvoiceSummary extends StatelessWidget {
  static const String _title = 'ملخص الفاتورة';
  static const String _labelTotal = 'إجمالي';
  static const String _labelDiscount = 'خصم';
  static const String _labelTax = 'ضريبة';
  static const String _labelNet = 'الصافي';

  const InvoiceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام sizeOf لضمان الأداء
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isMobile = screenWidth < 1100;

    return Card(
      // تحديد العرض ليكون كاملاً في الموبايل أو مرناً في الديسكتاب
      margin: isMobile ? EdgeInsets.zero : const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(Dimension.padding12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // ليأخذ مساحة المحتوى فقط
          children: const [
            Text(_title, style: TextStyle(fontWeight: FontWeight.bold)),
            Divider(),
            _Row(_labelTotal, '12,500'),
            _Row(_labelDiscount, '500'),
            _Row(_labelTax, '1,200'),
            Divider(),
            _Row(_labelNet, '13,200'),
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