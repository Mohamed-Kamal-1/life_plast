import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../all_data_service/data/models/product_model.dart';
import '../../../view_model/cubit/inventory_cubit.dart';
import '../../../view_model/cubit/inventory_state.dart';

class InventoryDataTable extends StatefulWidget {
  final List<String> columns;
  final Color headerColor;

  const InventoryDataTable(
      {super.key,
    required this.columns,
    required this.headerColor
  });

  @override
  State<InventoryDataTable> createState() => _InventoryDataTableState();
}

class _InventoryDataTableState extends State<InventoryDataTable> {
  late InventoryCubit cubit;

  @override
  void initState() {
    super.initState();
    context.read<InventoryCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (context, state) {
        List<ProductModel> products = [];
        if (state is InventoryLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is InventoryDataState) {
          products = state.inventoryProducts;
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
                    minWidth: MediaQuery.sizeOf(context).width - 150),
                child: DataTable(
                    headingRowColor:
                        WidgetStateProperty.all(widget.headerColor),
                    columns: widget.columns
                        .map((col) => DataColumn(
                            label: Text(col,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))))
                        .toList(),
                    rows: products.map((product) {
                      return DataRow(cells: [
                        DataCell(Text(product.name)),
                        DataCell(Text('${product.buyingPrice}')),
                        DataCell(Text('${product.sellingPrice}')),
                        DataCell(Text('${product.quantity}')),
                        DataCell(
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("حذف",
                                  style: TextStyle(
                                      color: Colors.redAccent, fontSize: 12)),
                              const SizedBox(width: 4),
                              IconButton(
                                icon: const Icon(Icons.delete_forever,
                                    color: Colors.redAccent),
                                onPressed: () {
                                  _showDeleteConfirmDialog(
                                      context, product.name);
                                },
                              ),
                            ],
                          ),
                        ),
                      ]);
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
    );
  }

  void _showDeleteConfirmDialog(BuildContext context, String productName) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("تأكيد الحذف"),
        content: Text("هل أنت متأكد من حذف الصنف ($productName)؟"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text("إلغاء")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              // تنفيذ الحذف من خلال الكيوبيت
              context.read<InventoryCubit>().deleteProduct(productName);
              Navigator.pop(ctx);
            },
            child:
                const Text("حذف الآن", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
