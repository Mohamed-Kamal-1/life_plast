import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    // استخدام MediaQuery.sizeOf(context) لتحديد عرض الكارت بناءً على الشاشة
    double screenWidth = MediaQuery.sizeOf(context).width;

    // إذا كانت الشاشة موبايل (أقل من 600) نلغي الـ Expanded ليتمدد الكارت بحرية
    // إذا كانت ديسكتاب نستخدم Expanded ليأخذ مساحة متساوية مع جيرانه
    bool useMobileLayout = screenWidth < 600;

    Widget cardContent = Container(
      // الحفاظ على نفس البادينج والديكوريشن الخاص بك
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title), // النص كما هو بدون تغيير
          const SizedBox(height: 8),
          Text(
            value, // القيمة كما هي بدون تغيير
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

    // المنطق المسؤول عن المقاسات فقط:
    if (useMobileLayout) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0), // مسافة بين الكروت في الموبايل
        child: SizedBox(
          width: double.infinity, // الكارت يأخذ العرض كاملاً في الموبايل
          child: cardContent,
        ),
      );
    } else {
      return cardContent;
    }
  }
}