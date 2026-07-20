import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ widgets/inventory_stats_cards.dart';
import '../ widgets/product_form_dialog.dart';
import '../../../../core/di/di.dart';
import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';
import '../widgets/category_management_dialog.dart';
import '../widgets/inventory_action_bar.dart';
import '../widgets/products_table.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<InventoryBloc>()..add(LoadInventoryEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('📦 إدارة المخزن والمستودعات'),
            actions: [
              IconButton(
                icon: const Icon(Icons.category),
                tooltip: 'إدارة الأقسام',
                onPressed: () {
                  final bloc = context.read<InventoryBloc>();
                  showDialog(
                    context: context,
                    builder: (ctx) => CategoryManagementDialog(bloc: bloc),
                  );
                },
              )
            ],
          ),
          body: BlocListener<InventoryBloc, InventoryState>(
            listener: (context, state) {
              if (state is InventoryActionSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.green),
                );
              } else if (state is InventoryError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<InventoryBloc, InventoryState>(
                builder: (context, state) {
                  if (state is InventoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is InventoryLoaded) {
                    return Column(
                      children: [
                        InventoryStatsCards(products: state.allProducts),
                        const SizedBox(height: 20),
                        InventoryActionBar(state: state),
                        const SizedBox(height: 16),
                        Expanded(child: ProductsTable(state: state)),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          floatingActionButton: BlocBuilder<InventoryBloc, InventoryState>(
            builder: (context, state) {
              if (state is InventoryLoaded) {
                return FloatingActionButton(
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    if (state.categories.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'برجاء إضافة أقسام أولاً قبل إضافة الأصناف')),
                      );
                      return;
                    }
                    showDialog(
                      context: context,
                      builder: (ctx) => ProductFormDialog(
                        categories: state.categories,
                        onSave: (prod, initialQty) {
                          context
                              .read<InventoryBloc>()
                              .add(AddProductEvent(prod, initialQty));
                        },
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        );
      }),
    );
  }
}
