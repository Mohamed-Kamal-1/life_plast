import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityDialog extends StatelessWidget {
  final TextEditingController controller = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("إدخال الكمية"),
      content: TextField(
        controller: controller,
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(labelText: "الكمية المطلوبة"),
        // دعم زر Enter من لوحة المفاتيح
        onSubmitted: (value) {
          Navigator.pop(context, int.tryParse(value) ?? 1);
        },
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, int.tryParse(controller.text) ?? 1),
          child: const Text("إضافة"),
        ),
      ],
    );
  }
}