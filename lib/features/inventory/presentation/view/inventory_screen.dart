import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_text/inventory_text/inventory_screen_text.dart';
import '../../../../core/di/di.dart';
import '../../../../core/dimensions/Dimension_app.dart';
import '../cubit/inventory_cubit.dart';
import '../cubit/inventory_state.dart';
import '../widgets/add_product_dialog.dart';
import '../widgets/inventory_data_table.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<InventoryCubit>()..fetchProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(InventoryStrings.appBarTitle),
        ),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(Dimension.padding20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            context.read<InventoryCubit>().search(value);
                          },
                          decoration: InputDecoration(
                            hintText: InventoryStrings.searchHint,
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimension.circular12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimension.spacing20),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimension.padding24,
                            vertical: Dimension.padding16,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                              value: context.read<InventoryCubit>(),
                              child: const AddProductDialog(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text(InventoryStrings.addProduct),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimension.heightSizeBox20),
                  Expanded(
                    child: BlocBuilder<InventoryCubit, InventoryState>(
                      builder: (context, state) {
                        if (state is InventoryLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is InventoryLoaded) {
                          if (state.products.isEmpty) {
                            return const Center(
                                child: Text('لا توجد أصناف بالمستودع حالياً'));
                          }
                          return InventoryDataTable(data: state.products);
                        } else if (state is InventoryError) {
                          return Center(child: Text(state.message));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
