import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_text/inventory_text/inventory_screen_text.dart';
import '../../../../core/dimensions/Dimension_app.dart';
import '../../domain/entities/product_entity.dart';
import '../cubit/inventory_cubit.dart';

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final _nameController = TextEditingController();
  final _buyingPriceController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _quantityController = TextEditingController();

  void _onSave(BuildContext context) {
    if (_nameController.text.trim().isNotEmpty) {
      final newProduct = ProductEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text.trim(),
        buyingPrice: double.tryParse(_buyingPriceController.text) ?? 0.0,
        sellingPrice: double.tryParse(_sellingPriceController.text) ?? 0.0,
        quantity: int.tryParse(_quantityController.text) ?? 0,
      );

      context.read<InventoryCubit>().createProduct(newProduct);
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _buyingPriceController.dispose();
    _sellingPriceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        InventoryStrings.addProduct,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: InventoryStrings.productName,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: Dimension.heightSizeBox12),
            TextField(
              controller: _buyingPriceController,
              decoration: const InputDecoration(
                labelText: InventoryStrings.buyingPrice,
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: Dimension.heightSizeBox12),
            TextField(
              controller: _sellingPriceController,
              decoration: const InputDecoration(
                labelText: InventoryStrings.sellingPrice,
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: Dimension.heightSizeBox12),
            TextField(
              controller: _quantityController,
              decoration: const InputDecoration(
                labelText: InventoryStrings.currentStock,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
          ),
          onPressed: () => _onSave(context),
          child: const Text('حفظ البيانات'),
        ),
      ],
    );
  }
}
