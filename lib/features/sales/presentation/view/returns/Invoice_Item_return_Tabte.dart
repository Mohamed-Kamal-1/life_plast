import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../all_data_service/data/models/product_model.dart';
import '../../view_model/cubit/sales_cubit.dart';
import '../../view_model/cubit/sales_invoice_state.dart';

class InvoiceItemReturnTable extends StatelessWidget {
  const InvoiceItemReturnTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesInvoiceCubit, SalesInvoiceState>(
      builder: (context, state) {
        List<ProductModel> items = [];
        if (state is SalesInvoiceUpdated) items = state.items;

        return DataTable(
          columns: const [
            DataColumn(label: Text("الصنف")),
            DataColumn(label: Text("الكمية")),
            DataColumn(label: Text("السعر")),
            DataColumn(label: Text("الإجمالي")),
            DataColumn(label: Text("حذف")),
          ],
          rows: items.asMap().entries.map((entry) {
            int index = entry.key;
            ProductModel item = entry.value;
            return DataRow(cells: [
              DataCell(Text(item.name)),
              DataCell(Text('${item.quantity}')),
              DataCell(Text('${item.sellingPrice}')),
              // الحساب الرياضي للإجمالي
              DataCell(Text('${item.sellingPrice * item.quantity}')),
              DataCell(IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () =>
                    context.read<SalesInvoiceCubit>().removeProduct(index),
              )),
            ]);
          }).toList(),
        );
      },
    );
  }
}
