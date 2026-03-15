import 'package:flutter/material.dart';

typedef OnChanged = void Function(DateTime? value);

class DatePickerField extends StatelessWidget {
  final String labelText;
  final OnChanged onChanged;

  const DatePickerField(
      {super.key, required this.labelText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.calendar_today, size: 20),
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2030),
          );

          // هنا بنبعت التاريخ اللي العميل اختاره للـ onChanged عشان يروح للكيوبيت
          if (pickedDate != null) {
            onChanged(pickedDate);
          }
        });
  }
}
