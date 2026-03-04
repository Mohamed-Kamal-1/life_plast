import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? label;
  final IconData? icon;

  const CustomInputField({super.key,  this.label,  this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
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