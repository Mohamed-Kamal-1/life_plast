import 'package:flutter/material.dart';

import '../../../../../core/app_text/sales_text/sales_screen_text.dart';

class ProductSearchSection extends StatelessWidget {
  const ProductSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: SalesStrings.searchProduct,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("إضافة للصنف")
          ),
        ],
      ),
    );
  }
}