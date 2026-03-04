import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widget/Filter_Date_Field.dart';

class DateRangeFilterSection extends StatelessWidget {
  const DateRangeFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    bool isDesktop = width > 600;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 20,
          runSpacing: 15,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text("فلترة بالمدة:", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              width: isDesktop ? 200 : double.infinity,
              child: const FilterDateField(label: "من تاريخ"),
            ),
            SizedBox(
              width: isDesktop ? 200 : double.infinity,
              child: const FilterDateField(label: "إلى تاريخ"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // هنا سيتم استدعاء دالة البحث من الـ API بناءً على التواريخ
              },
              icon: const Icon(Icons.search),
              label: const Text("عرض النتائج"),
            )
          ],
        ),
      ),
    );
  }
}

