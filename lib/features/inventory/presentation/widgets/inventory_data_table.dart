import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_text/inventory_text/inventory_screen_text.dart';
import '../../../../core/dimensions/Dimension_app.dart';
import '../../domain/entities/product_entity.dart';
import '../cubit/inventory_cubit.dart';

class InventoryDataTable extends StatelessWidget {
  final List<ProductEntity> data;

  const InventoryDataTable({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimension.circular12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
              )
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primaryContainer),
                horizontalMargin: Dimension.padding20,
                columnSpacing: Dimension.spacing24,
                columns: const [
                  DataColumn(
                    label: Text(InventoryStrings.productName),
                  ),
                  DataColumn(
                    label: Text(InventoryStrings.buyingPrice),
                  ),
                  DataColumn(
                    label: Text(InventoryStrings.sellingPrice),
                  ),
                  DataColumn(
                    label: Text(InventoryStrings.currentStock),
                  ),
                  DataColumn(
                    label: Text(InventoryStrings.productDelete),
                  ),
                ],
                rows: data.map((product) {
                  return DataRow(
                    cells: [
                      DataCell(Text(product.name)),
                      DataCell(Text(product.buyingPrice.toStringAsFixed(2))),
                      DataCell(Text(product.sellingPrice.toStringAsFixed(2))),
                      DataCell(
                        Text(
                          product.quantity.toString(),
                          style: TextStyle(
                            color: product.quantity > 0
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        IconButton(
                          icon:
                              const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () {
                            context
                                .read<InventoryCubit>()
                                .removeProduct(product.id);
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
