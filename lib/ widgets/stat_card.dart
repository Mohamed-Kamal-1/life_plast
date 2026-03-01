import 'package:flutter/material.dart';
import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    // نعرف عرض الشاشة
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    // الحاوية الأساسية للكارت
    Widget cardContent = Container(
      // في الديسكتوب مش هنحدد عرض عشان الـ Expanded هيقوم بالواجب
      // في الموبايل هنحدد عرض عشان الـ Wrap يشتغل صح
      width: isMobile ? (screenWidth / 2) - Dimension.widthSizeBox24 : null,
      padding: const EdgeInsets.all(Dimension.padding16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimension.radius8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: Dimension.heightSizeBox8),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

    // لو ديسكتوب نغلفه بـ Expanded عشان يفرش في الشاشة زي الصورة اللي عجباك
    return isMobile ? cardContent : Expanded(child: cardContent);
  }
}