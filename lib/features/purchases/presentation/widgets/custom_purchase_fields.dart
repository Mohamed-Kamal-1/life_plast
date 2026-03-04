import 'package:flutter/material.dart';

import '../../../../core/app_text/purchases_text/purchases_screen_text.dart';

class PurchaseTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final int maxLines;
  const PurchaseTextField({super.key, required this.label, this.icon, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class PurchaseDropdownField extends StatelessWidget {
  const PurchaseDropdownField({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: PurchaseStrings.paymentMethod,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.payment),
      ),
      items: const [
        DropdownMenuItem(value: "cash", child: Text(PurchaseStrings.cash)),
        DropdownMenuItem(value: "bank", child: Text(PurchaseStrings.bank)),
      ],
      onChanged: (v) {},
    );
  }
}