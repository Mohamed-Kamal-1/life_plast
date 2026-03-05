import 'package:accounting_desktop/core/AppFromField.dart';
import 'package:accounting_desktop/features/inventory/data/models/product_model.dart';
import 'package:flutter/material.dart';

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController buyingPriceController = TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();

  String? productName;
  String? quantity;
  String? buyingPrice;
  String? sellingPrice;
  late ProductModel _productModel;

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    quantityController.dispose();
    buyingPriceController.dispose();
    sellingPriceController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("تعريف صنف جديد بالمخزن"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              sendProduct: (controllerName) {
                productName = controllerName;
              },
              label: "اسم الصنف",
              textInputAction: TextInputAction.next,
              controller: productNameController,
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 10),
            AppTextField(
              sendProduct: (controllerName) {
                buyingPrice = controllerName;
              },
              label: "سعر الشراء الافتراضي",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: buyingPriceController,
            ),
            const SizedBox(height: 10),
            AppTextField(
              sendProduct: (controllerName) {
                sellingPrice = controllerName;
              },
              label: "سعر البيع الافتراضي",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: sellingPriceController,
            ),

            AppTextField(
              label: "الكميه",
              sendProduct: (controllerName) {
                quantity = controllerName;
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: quantityController,
            ),
            // SizedBox(height: 10),
            // // TextField(decoration: InputDecoration(labelText: "الباركود", border: OutlineInputBorder())),
            // SizedBox(height: 10),
            // TextField(decoration: InputDecoration(labelText: "سعر الشراء الافتراضي", border: OutlineInputBorder())),
            // SizedBox(height: 10),
            // TextField(decoration: InputDecoration(labelText: "سعر البيع الافتراضي", border: OutlineInputBorder())),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            onPressed: () {
              _productModel = ProductModel(
                name: productName ?? '',
                buyingPrice: double.parse(buyingPrice ?? '0.0'),
                sellingPrice: double.parse(sellingPrice ?? '0.0'),
                quantity: int.parse(quantity ?? '0'),
              );
              Navigator.pop(context);
            },
            child: const Text("حفظ بالمخزن", style: TextStyle(color: Colors.white))
        ),
      ],
    );
  }
}