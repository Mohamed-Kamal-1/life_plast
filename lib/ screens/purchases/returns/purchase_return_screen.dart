import 'package:flutter/material.dart';

import 'purchase_return_header.dart';
import 'purchase_return_items_table.dart';
import 'purchase_return_actions.dart';

class PurchaseReturnScreen extends StatelessWidget {
  const PurchaseReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PurchaseReturnHeader(),
        SizedBox(height: 12),
        Expanded(
          child: PurchaseReturnItemsTable(),
        ),
        SizedBox(height: 12),
        PurchaseReturnActions(),
      ],
    );
  }
}