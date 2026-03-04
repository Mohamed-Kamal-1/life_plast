import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_text/sales_text/sales_screen_text.dart';

class CustomerInfoSection extends StatelessWidget {
  const CustomerInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 10,
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            decoration: InputDecoration(labelText: SalesStrings.customerName, border: OutlineInputBorder()),
          ),
        ),
        SizedBox(
          width: 300,
          child: TextField(
            decoration: InputDecoration(labelText: SalesStrings.phoneNumber, border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}