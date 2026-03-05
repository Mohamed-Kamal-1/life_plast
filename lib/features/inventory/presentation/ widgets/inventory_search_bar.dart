import 'package:flutter/material.dart';

import '../../../../core/app_text/inventory_text/inventory_screen_text.dart';
import '../../../purchases/presentation/widgets/add_product_dialog.dart';

class InventorySearchBar extends StatelessWidget {
  const InventorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: InventoryStrings.searchHint,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey[800],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddProductDialog(),
            );
          },
          icon: const Icon(Icons.add_box),
          label: const Text(InventoryStrings.addProduct),
        ),
      ],
    );
  }
}