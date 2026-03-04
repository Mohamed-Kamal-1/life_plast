import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterDateField extends StatelessWidget {
  final String label;
  const FilterDateField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.calendar_month, size: 20),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      onTap: () => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2060),
      ),
    );
  }
}