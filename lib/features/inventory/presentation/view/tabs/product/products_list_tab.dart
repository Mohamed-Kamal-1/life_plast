import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ widgets/inventory_search_bar.dart';
import 'inventory_table.dart';
import '../../../../../../core/app_text/inventory_text/inventory_screen_text.dart';
import '../../../../../../core/di/di.dart';
import '../../../view_model/cubit/inventory_cubit.dart';


class ProductsListTab extends StatelessWidget {
  const ProductsListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const InventorySearchBar(),
          const SizedBox(height: 20),
          Expanded(
            child: InventoryDataTable(
              headerColor: const Color(0xFFF5F5F5),
              columns: const [
                InventoryStrings.productName,
                InventoryStrings.buyingPrice,
                InventoryStrings.sellingPrice,
                InventoryStrings.currentStock,

              ],
            ),
          ),
        ],
      ),
    );
  }
}