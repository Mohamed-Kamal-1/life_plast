import 'package:flutter/material.dart';

class SalesReturnActions extends StatelessWidget {
  const SalesReturnActions({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام sizeOf لتحديد المحاذاة بناءً على نوع الشاشة
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      alignment: isMobile ? Alignment.center : Alignment.centerLeft, // تغيير الاتجاه لليسار (RTL)
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {},
            child: const Text('إلغاء'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.undo),
            label: const Text('تنفيذ المرتجع'),
          ),
        ],
      ),
    );
  }
}