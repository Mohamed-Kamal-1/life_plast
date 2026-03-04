import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  final String labelText;

  const DatePickerField({super.key, required this.labelText});

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
      onTap: () => showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030)),
    );
  }
}
