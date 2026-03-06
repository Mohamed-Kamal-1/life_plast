import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/di.dart';
import '../../../view_model/cubit/inventory_cubit.dart';
import '../../../view_model/cubit/inventory_state.dart';

class InventoryDataTable extends StatelessWidget {
  final List<String> columns;
  final Color headerColor;

  const InventoryDataTable(
      {super.key,
    required this.columns,
    required this.headerColor
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<InventoryCubit>()..loadProducts(),
      child: BlocBuilder<InventoryCubit, InventoryState>(
        builder: (context, state) {
          if (state is InventoryDataState) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.sizeOf(context).width - 32),
                  child: DataTable(
                      headingRowColor: WidgetStateProperty.all(headerColor),
                      columns: columns
                          .map((col) => DataColumn(
                              label: Text(col,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold))))
                          .toList(),
                      rows: state.inventoryProducts.map((product) {
                        return DataRow(
                          cells: [
                            DataCell(Text(product.name)),
                            DataCell(Text('${product.buyingPrice}')),
                            DataCell(Text('${product.sellingPrice}')),
                            DataCell(Text('${product.quantity}')),
                          ],
                        );
                      }).toList()),
                ),
              ),
            );
          }
          if (state is InventoryErrorState) {
            return Text('$state');
          }
          return Container();
        },
      ),
    );
  }
}