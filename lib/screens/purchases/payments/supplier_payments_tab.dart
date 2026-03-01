import 'package:flutter/material.dart';

import 'supplier_payment_form.dart';
import 'supplier_payments_table.dart';
import 'supplier_payment_summary.dart';

class SupplierPaymentsTab extends StatelessWidget {
  const SupplierPaymentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              SupplierPaymentForm(),
              SizedBox(height: 12),
              Expanded(child: SupplierPaymentsTable()),
            ],
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: SupplierPaymentSummary(),
        ),
      ],
    );
  }
}