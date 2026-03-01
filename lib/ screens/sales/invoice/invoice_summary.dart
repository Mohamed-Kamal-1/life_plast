import 'package:flutter/material.dart';
import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';

class InvoiceSummary extends StatelessWidget {
  static const String _title = 'ملخص الفاتورة';
  static const String _labelTotal = 'إجمالي';
  static const String _labelDiscount = 'خصم';
  static const String _labelTax = 'ضريبة';
  static const String _labelNet = 'الصافي';

  const InvoiceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدمنا LayoutBuilder عشان نتحكم في عرض الكارت في الديسكتوب
    return LayoutBuilder(
        builder: (context, constraints) {
          return Card(
            elevation: 2, // إضافة ظل خفيف عشان تبان احترافية
            margin: EdgeInsets.zero,
            child: Container(
              // في الديسكتوب بنحدد عرض أقصى عشان ميبقاش شكلها "ماطط"، في الموبايل بتاخد العرض كله
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.all(Dimension.padding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // عشان مياخدش طول الشاشة كله
                children: [
                  const Text(
                      _title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                  ),
                  const Divider(height: Dimension.heightSizeBox24),

                  const _Row(_labelTotal, '12,500'),
                  const _Row(_labelDiscount, '500'),
                  const _Row(_labelTax, '1,200'),

                  const Divider(height: Dimension.heightSizeBox24),

                  // الصافي بلون مميز وخط أكبر
                  const _Row(
                      _labelNet,
                      '13,200',
                      isTotal: true
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const _Row(this.label, this.value, {this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimension.padding8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 15,
              fontWeight: FontWeight.bold,
              color: isTotal ? Colors.blueAccent : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}