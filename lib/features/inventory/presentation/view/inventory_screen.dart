import 'package:flutter/material.dart';
import '../../../../core/app_text/inventory_text/inventory_screen_text.dart';

import 'tabs/products_list_tab.dart';
import 'tabs/stock_movement_tab.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(InventoryStrings.appBarTitle),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.storage), text: InventoryStrings.inventoryTab),
              Tab(icon: Icon(Icons.swap_vert), text: InventoryStrings.movementTab),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProductsListTab(),
            StockMovementTab(),
          ],
        ),
      ),
    );
  }
}