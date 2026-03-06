import 'package:accounting_desktop/core/di/di.dart';
import 'package:accounting_desktop/features/inventory/presentation/view/tabs/product/products_list_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_text/inventory_text/inventory_screen_text.dart';
import '../view_model/cubit/inventory_cubit.dart';
import 'tabs/stock/stock_shortages_tab.dart';

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
              Tab(
                  icon: Icon(Icons.list_alt),
                  text: InventoryStrings.productsTab),
              Tab(
                  icon: Icon(Icons.low_priority),
                  text: InventoryStrings.shortagesTab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const ProductsListTab(),
            const StockShortagesTab(),
          ],
        ),
      ),
    );
  }
}