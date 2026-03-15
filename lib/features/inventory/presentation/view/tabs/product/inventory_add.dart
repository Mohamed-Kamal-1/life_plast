import 'package:accounting_desktop/core/AppFromField.dart';
import 'package:flutter/material.dart';

import '../../../../../all_data_service/data/models/product_model.dart';

typedef SendProduct = void Function(ProductModel product);

class InventoryAdd extends StatefulWidget {
  final SendProduct product;

  const InventoryAdd({super.key, required this.product});

  @override
  State<InventoryAdd> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<InventoryAdd> {
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
              controller: productNameController,
              sendProduct: (controllerName) {
                productName = controllerName;
              },
              label: "اسم الصنف",
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: buyingPriceController,
              sendProduct: (controllerName) {
                buyingPrice = controllerName;
              },
              label: "سعر الشراء الافتراضي",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: sellingPriceController,
              sendProduct: (controllerName) {
                sellingPrice = controllerName;
              },
              label: "سعر البيع الافتراضي",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),

            AppTextField(
              label: "الكميه",
              controller: quantityController,
              sendProduct: (controllerName) {
                quantity = controllerName;
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
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
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            onPressed: () {
              _productModel = ProductModel(
                name: productName ?? '',
                buyingPrice: double.parse(buyingPrice ?? '0.0'),
                sellingPrice: double.parse(sellingPrice ?? '0.0'),
                quantity: int.parse(quantity ?? '0'),
              );

              widget.product(_productModel);
              Navigator.pop(context);
            },
            child: const Text("حفظ بالمخزن",
                style: TextStyle(color: Colors.white))),
      ],
    );
  }
}
