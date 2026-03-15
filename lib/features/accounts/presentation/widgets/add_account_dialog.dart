import 'package:flutter/material.dart';

import '../../../all_data_service/data/models/account/all_accounts.dart';
import '../view_model/cubit/Account_Cubit.dart';

class AddAccountDialog extends StatefulWidget {
  final String type;
  final AccountsCubit cubit; // نمرر الكيوبيت هنا

  const AddAccountDialog({super.key, required this.type, required this.cubit});

  @override
  State<AddAccountDialog> createState() => _AddAccountDialogState();
}

class _AddAccountDialogState extends State<AddAccountDialog> {
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final cityCtrl = TextEditingController();

  void _onSave() {
    if (nameCtrl.text.trim().isNotEmpty) {
      final newAcc = AccountModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameCtrl.text.trim(),
        phone: phoneCtrl.text.trim(),
        city: cityCtrl.text.trim(),
        type: widget.type,
      );

      widget.cubit.addNewAccount(newAcc); // استخدام الكيوبيت الممرر
      Navigator.of(context).pop(); // إغلاق الديالوج
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("إضافة ${widget.type == 'customer' ? 'عميل' : 'جديد'}",
          textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: "الاسم", border: OutlineInputBorder()),
              onSubmitted: (_) => _onSave(), // Enter يضيف
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneCtrl,
              decoration: const InputDecoration(labelText: "الهاتف", border: OutlineInputBorder()),
              keyboardType: TextInputType.phone,
              onSubmitted: (_) => _onSave(), // Enter يضيف
            ),
            const SizedBox(height: 10),
            TextField(
              controller: cityCtrl,
              decoration: const InputDecoration(labelText: "المدينة", border: OutlineInputBorder()),
              onSubmitted: (_) => _onSave(), // Enter يضيف
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
          onPressed: _onSave, // الضغط يضيف
          child: const Text("حفظ البيانات"),
        ),
      ],
    );
  }
}