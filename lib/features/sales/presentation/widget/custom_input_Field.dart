import 'package:flutter/material.dart';

typedef OnChanged = void Function(String? value);

class CustomInputField extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final OnChanged onChanged;

  const CustomInputField(
      {super.key, this.label, this.icon, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}