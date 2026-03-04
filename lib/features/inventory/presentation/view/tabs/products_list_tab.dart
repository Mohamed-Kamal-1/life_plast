import 'package:flutter/material.dart';
import '../../ widgets/inventory_search_bar.dart';
import '../../ widgets/inventory_table.dart';
import '../../../../../core/app_text/inventory_text/inventory_screen_text.dart';


class ProductsListTab extends StatelessWidget {
  const ProductsListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          InventorySearchBar(),
          SizedBox(height: 20),
          Expanded(
            child: InventoryDataTable(
              headerColor: Color(0xFFF0F4F8),
              columns: [
                InventoryStrings.productCode,
                InventoryStrings.productName,
                InventoryStrings.buyingPrice,
                InventoryStrings.sellingPrice,
                InventoryStrings.currentStock,
                "الإجراءات",
              ],
            ),
          ),
        ],
      ),
    );
  }
}