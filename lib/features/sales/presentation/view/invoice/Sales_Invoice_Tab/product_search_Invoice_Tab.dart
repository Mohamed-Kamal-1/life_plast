import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app_text/sales_text/sales_screen_text.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../all_data_service/data/models/product_model.dart';

import '../../../view_model/cubit/sales_cubit.dart';
import 'Quantity_Dialog.dart';


class ProductSearchInvoiceTab extends StatefulWidget {
  // final SendProduct sendProduct;

  const ProductSearchInvoiceTab({super.key});

  @override
  State<ProductSearchInvoiceTab> createState() =>
      _ProductSearchInvoiceTabState();
}

class _ProductSearchInvoiceTabState extends State<ProductSearchInvoiceTab> {
  // ProductModel? selectedProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Autocomplete<ProductModel>(
        displayStringForOption: (option) {
          return '${option.name} (السعر: ${option.sellingPrice})';
        },
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<ProductModel>.empty();
          }

          return getIt<ProductService>().products.where((ProductModel option) {
            return option.name
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
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
          // 1. اظهر دايالوج الكمية
          final int? qty = await showDialog<int>(
            context: context,
            builder: (context) => QuantityDialog(),
          );

          // 2. إذا أدخل العميل كمية، أضفها للجدول عبر الكيوبيت
          if (qty != null && qty > 0) {
            context.read<SalesInvoiceCubit>().addProduct(selection, qty,);
          }
        },
      ),
    );
  }
}
