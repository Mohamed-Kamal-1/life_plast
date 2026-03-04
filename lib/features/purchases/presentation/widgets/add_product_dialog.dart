import 'package:flutter/material.dart';

class AddProductDialog extends StatelessWidget {
  const AddProductDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("تعريف صنف جديد بالمخزن"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            TextField(decoration: InputDecoration(labelText: "اسم الصنف", border: OutlineInputBorder())),
            SizedBox(height: 10),
            // TextField(decoration: InputDecoration(labelText: "الباركود", border: OutlineInputBorder())),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: "سعر الشراء الافتراضي", border: OutlineInputBorder())),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: "سعر البيع الافتراضي", border: OutlineInputBorder())),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            onPressed: () {
              // هنا كود الـ Logic لإرسال الصنف للباك إيند
              Navigator.pop(context);
            },
            child: const Text("حفظ بالمخزن", style: TextStyle(color: Colors.white))
        ),
      ],
    );
  }
}