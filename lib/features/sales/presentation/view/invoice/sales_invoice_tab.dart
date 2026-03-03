import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../logic/inventory_provider.dart'; // تأكد من المسار

class SalesInvoiceTab extends StatelessWidget {
  const SalesInvoiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام context.watch عشان الصفحة تحدث نفسها
    final provider = context.watch<InventoryProvider>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text("أصناف الفاتورة", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () => _showProductSelectionDialog(context, provider),
                icon: const Icon(Icons.search),
                label: const Text("بحث واختيار صنف"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              ),
            ],
          ),
        ),

        Expanded(
          child: provider.invoiceItems.isEmpty // تغيير المسمى هنا
              ? const Center(child: Text("ابدأ باختيار الأصناف لإضافتها للفاتورة"))
              : SingleChildScrollView(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('الكود')),
                DataColumn(label: Text('الصنف')),
                DataColumn(label: Text('السعر')),
                DataColumn(label: Text('الكمية')),
                DataColumn(label: Text('الإجمالي')),
                DataColumn(label: Text('حذف')),
              ],
              rows: provider.invoiceItems.asMap().entries.map((entry) {
                var item = entry.value;
                return DataRow(cells: [
                  DataCell(Text(item.code)),
                  DataCell(Text(item.name)),
                  DataCell(Text(item.salePrice.toString())),
                  DataCell(Text(item.quantity.toString())),
                  DataCell(Text((item.salePrice * item.quantity).toString())),
                  DataCell(IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => provider.removeFromInvoice(entry.key),
                  )),
                ]);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  void _showProductSelectionDialog(BuildContext context, InventoryProvider provider) {
    // بنجيب المنتجات من القائمة المتاحة في المخزن
    final allProducts = provider.inventoryList;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("اختر صنفاً من المخزن"),
        content: SizedBox(
          width: 400,
          height: 400,
          child: ListView.builder(
            itemCount: allProducts.length,
            itemBuilder: (context, index) {
              final product = allProducts[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text("الكود: ${product.code} - السعر: ${product.salePrice}"),
                trailing: const Icon(Icons.add_circle, color: Colors.green),
                onTap: () {
                  provider.addToInvoice(product);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}