import 'package:flutter/material.dart';

import '../../../../../core/app_text/sales_text/sales_screen_text.dart';
import '../../../../../core/di/di.dart';
import '../../../../all_data_service/data/models/product_model.dart';


class ProductSearchReturnInvoiceTab extends StatefulWidget {
  const ProductSearchReturnInvoiceTab({super.key});

  @override
  State<ProductSearchReturnInvoiceTab> createState() => _ProductSearchReturnInvoiceTabState();
}

class _ProductSearchReturnInvoiceTabState extends State<ProductSearchReturnInvoiceTab> {

  ProductModel? selectedProduct;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Autocomplete<ProductModel>(
              // 1. تحديد النص اللي هيظهر في البحث لما تختار صنف
              displayStringForOption: (ProductModel option) => option.name,

              // 2. بناء قائمة الاقتراحات بناءً على اللي العميل بيكتبه
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<ProductModel>.empty();
                }
                // بنبحث في السيرفس ونرجع الأصناف اللي اسمها بيحتوي على النص المكتوب
                return getIt<ProductService>().products.where((ProductModel option) {
                  return option.name.toLowerCase().contains(textEditingValue.text.toLowerCase());
                }

                );
              },

              // 3. تصميم حقل البحث نفسه (عشان يفضل زي ما أنت عاوزه)
              fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: SalesStrings.searchProduct,
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(),
                  ),
                  onSubmitted: (value) {
                    onFieldSubmitted(); // لتنفيذ عملية الاختيار عند ضغط Enter
                  },
                );
              },

              // 4. إيه اللي يحصل لما العميل يختار صنف من القائمة
              onSelected: (ProductModel selection) {
                 selectedProduct = selection;
                debugPrint('تم اختيار: ${selection.name}');
              },
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton.icon(
              onPressed: () {
                if (selectedProduct != null) {
                  // هنا هننادي على الكوبيت عشان يضيف المنتج للفاتورة
                  // context.read<InvoiceCubit>().addItem(selectedProduct!);

                  debugPrint("أضف للفاتورة: ${selectedProduct!.name}");

                  // مسح الاختيار بعد الإضافة ليكون جاهز للبحث التالي
                  selectedProduct = null;
                }
              },
              icon: const Icon(Icons.add),
              label: const Text("إضافة للفاتورة")
          ),
        ],
      ),
    );
  }
}


