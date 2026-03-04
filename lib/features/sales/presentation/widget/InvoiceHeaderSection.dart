import 'package:flutter/material.dart';

import '../../../../core/app_text/sales_text/sales_screen_text.dart';
import '../../../../core/widget/date_widget.dart';
import 'custom_input_Field.dart';

class InvoiceHeaderSection extends StatelessWidget {
  const InvoiceHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    bool isDesktop = width > 800;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          SizedBox(
              width: isDesktop ? 150 : width * 0.4,
              child: const CustomInputField(
                  label: SalesStrings.invoiceNumber, icon: Icons.numbers)),
          SizedBox(
              width: isDesktop ? 300 : double.infinity,
              child: const CustomInputField(
                  label: SalesStrings.customerName, icon: Icons.person)),
          SizedBox(
              width: isDesktop ? 250 : double.infinity,
              child: const CustomInputField(
                  label: SalesStrings.repName, icon: Icons.badge)),
          SizedBox(
              width: isDesktop ? 200 : width * 0.45,
              child: const CustomInputField(
                  label: SalesStrings.phone, icon: Icons.phone)),
          SizedBox(
              width: isDesktop ? 180 : width * 0.45,
              child: const DatePickerField(labelText: SalesStrings.date)),
        ],
      ),
    );
  }
}


