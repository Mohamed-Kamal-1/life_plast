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
    // استخدام sizeOf لضبط عرض الحقل ديناميكياً
    final double screenWidth = MediaQuery.sizeOf(context).width;

    // منطق المقاسات: إذا كان عرض الشاشة أقل من العرض المحدد للحقل، يأخذ العرض الكامل
    // خصمنا 48 بكسل (تقريبياً) لتعويض الـ Padding الخارجي في AppScreen
    final double responsiveWidth = (screenWidth - 48) < width ? double.infinity : width;

    return SizedBox(
      width: responsiveWidth,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          // إضافة isDense لتحسين المظهر في الموبايل
          isDense: true,
        ),
      ),
    );
  }
}