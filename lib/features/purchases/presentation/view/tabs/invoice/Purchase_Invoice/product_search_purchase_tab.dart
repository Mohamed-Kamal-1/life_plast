import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/app_text/sales_text/sales_screen_text.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../all_data_service/data/models/product_model.dart';
import '../../../../../../sales/presentation/view/invoice/Sales_Invoice_Tab/Quantity_Dialog.dart';
import '../../../../view_model/cubit/purchase_invoice_cubit/purchase_invoice_cubit.dart';

class ProductSearchPurchase extends StatelessWidget {
  const ProductSearchPurchase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Autocomplete<ProductModel>(
              displayStringForOption: (option) =>
                  '${option.name} (شراء: ${option.buyingPrice})',
              optionsBuilder: (textValue) {
                if (textValue.text.isEmpty) return const Iterable.empty();
                return getIt<ProductService>().products.where((p) =>
                    p.name.toLowerCase().contains(textValue.text.toLowerCase()));
              },

              fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: SalesStrings.searchProduct,
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xffcbb08a),
                      ),
                    ),
                  ),
                  onSubmitted: (value) {
                    onFieldSubmitted();
                  },
                );
              },

              onSelected: (ProductModel selection) async {
                // 1. إظهار دايالوج الكمية اللي عندك
                final int? qty = await showDialog<int>(
                  context: context,
                  builder: (context) => QuantityDialog(),
                );

                // 2. إذا أدخل العميل كمية، نرسلها لكيوبيت المشتريات
                if (qty != null && qty > 0) {
                  context.read<PurchaseInvoiceCubit>().addProduct(selection, qty);
                }
              },
            ),
          ),
          const SizedBox(width: 10),
          // ✅ زر إضافة صنف جديد للمخزن

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[800],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            ),
            onPressed: () => _showAddDialog(context),
            icon: const Icon(Icons.add_box),
            label: const Text('اضف صنف'),
          ),
        ],
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final name = TextEditingController();
    final buy = TextEditingController();
    final sell = TextEditingController();
    final qty = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("تعريف صنف جديد"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: name,
                decoration: const InputDecoration(labelText: "اسم الصنف")),
            TextField(
                controller: buy,
                decoration: const InputDecoration(labelText: "سعر الشراء"),
                keyboardType: TextInputType.number),
            TextField(
                controller: sell,
                decoration: const InputDecoration(labelText: "سعر البيع"),
                keyboardType: TextInputType.number),
            TextField(
                controller: qty,
                decoration:
                    const InputDecoration(labelText: "الكمية الموجودة حالياً"),
                keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              final newProd = ProductModel(
                name: name.text,
                buyingPrice: double.parse(buy.text),
                sellingPrice: double.parse(sell.text),
                quantity: int.parse(qty.text),
              );
              getIt<ProductService>().addProduct(newProd); // حفظ في المخزن
              Navigator.pop(ctx);
            },
            child: const Text("حفظ للمخزن"),
          )
        ],
      ),
    );
  }
}
