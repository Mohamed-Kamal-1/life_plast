import 'package:flutter/material.dart';

class QuotationForm extends StatelessWidget {
  const QuotationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _Field('رقم العرض', enabled: false),
            _Field('تاريخ العرض'),
            _Field('تاريخ الصلاحية'),
            _Field('العميل'),
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

  const _Field(this.label, {this.enabled = true, this.width = 220});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    // إذا كان عرض الشاشة (مع خصم الهوامش) أقل من عرض الحقل، اجعله يأخذ العرض بالكامل
    final double responsiveWidth = (screenWidth - 48) < width ? double.infinity : width;

    return SizedBox(
      width: responsiveWidth,
      child: TextField(
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true, // لتقليل ارتفاع الحقل في الموبايل
        ),
      ),
    );
  }
}