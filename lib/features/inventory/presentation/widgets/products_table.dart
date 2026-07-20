import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ widgets/product_form_dialog.dart';
import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';

class ProductsTable extends StatelessWidget {
  final InventoryLoaded state;

  const ProductsTable({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.filteredProducts.isEmpty) {
      return const Center(
          child: Text('لا توجد أصناف مطابقة للبحث أو القسم المحدد.'));
    }

    return Card(
      elevation: 2,
      child: ListView(
        children: [
          DataTable(
            columns: const [
              DataColumn(label: Text('كود الصنف')),
              DataColumn(label: Text('اسم الصنف')),
              DataColumn(label: Text('الكمية الحالية')),
              DataColumn(label: Text('سعر الشراء')),
              DataColumn(label: Text('سعر البيع')),
              DataColumn(label: Text('الحالة')),
              DataColumn(label: Text('إجراءات')),
            ],
            rows: state.filteredProducts.map((prod) {
              final isLow = prod.currentQuantity <= prod.minQty;
              return DataRow(
                cells: [
                  DataCell(Text(prod.id.substring(0, 5).toUpperCase())),
                  DataCell(Text(prod.name)),
                  DataCell(Text(prod.currentQuantity.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isLow ? Colors.red : Colors.black))),
                  DataCell(Text('${prod.purchasePrice.toStringAsFixed(2)} ج')),
                  DataCell(Text('${prod.salePrice.toStringAsFixed(2)} ج')),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color:
                            isLow ? Colors.red.shade100 : Colors.green.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(isLow ? 'منخفض' : 'متوفر',
                          style: TextStyle(
                              color: isLow ? Colors.red : Colors.green,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => ProductFormDialog(
                                product: prod,
                                categories: state.categories,
                                onSave: (updatedProd, _) {
                                  context
                                      .read<InventoryBloc>()
                                      .add(UpdateProductEvent(updatedProd));
                                },
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () =>
                              _confirmDeleteProduct(context, prod.id),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteProduct(BuildContext context, String id) {
    final bloc = context.read<InventoryBloc>();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('تأكيد الحذف النهائي'),
        content: const Text(
            'حذف الصنف سيحذف كافة السجلات التابعة له، هل أنت متأكد؟'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('إلغاء')),
          TextButton(
            onPressed: () {
              bloc.add(DeleteProductEvent(id));
              Navigator.pop(ctx);
            },
            child: const Text('حذف', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
