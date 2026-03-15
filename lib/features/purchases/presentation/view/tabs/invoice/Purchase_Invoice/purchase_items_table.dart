import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../all_data_service/data/models/product_model.dart';
import '../../../../view_model/cubit/purchase_invoice_cubit/purchase_invoice_cubit.dart';
import '../../../../view_model/cubit/purchase_invoice_state/purchase_invoice_state.dart';



class PurchaseItemsTable extends StatelessWidget {
  const PurchaseItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseInvoiceCubit, PurchaseInvoiceState>(
      builder: (context, state) {
        List<ProductModel> items = [];
        if (state is PurchaseInvoiceUpdated) items = state.items;

        return DataTable(
          columns: const [
            DataColumn(label: Text("الصنف")),
            DataColumn(label: Text("الكمية")),
            DataColumn(label: Text("سعر الشراء")), // ✅ سعر الشراء
            DataColumn(label: Text("الإجمالي")),
            DataColumn(label: Text("حذف")),
          ],
          rows: items.asMap().entries.map((entry) {
            int index = entry.key;
            ProductModel item = entry.value;
            return DataRow(cells: [
              DataCell(Text(item.name)),
              DataCell(Text('${item.quantity}')),
              DataCell(Text('${item.buyingPrice}')), // ✅ عرض سعر الشراء
              // ✅ الحساب الرياضي للإجمالي (كمية × سعر شراء)
              DataCell(Text('${item.buyingPrice * item.quantity}')),
              DataCell(IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () =>
                    context.read<PurchaseInvoiceCubit>().removeProduct(index),
              )),
            ]);
          }).toList(),
        );
      },
    );
  }
}