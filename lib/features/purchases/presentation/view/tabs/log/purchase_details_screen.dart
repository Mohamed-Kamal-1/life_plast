import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../sales/data/models/invoice_item_model.dart';

class PurchaseDetailsScreen extends StatelessWidget {
  final InvoiceModel invoice;
  const PurchaseDetailsScreen({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل فاتورة شراء #${invoice.id}"), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildRow("المورد:", invoice.customerName),
                    _buildRow("التاريخ:", invoice.date),
                    _buildRow("الهاتف:", invoice.phone),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("الأصناف المشتراة", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: invoice.items.length,
              itemBuilder: (context, index) {
                final item = invoice.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("الكمية: ${item.quantity} × ${item.buyingPrice}"),
                  trailing: Text("${item.quantity * item.buyingPrice} ج.م"),
                );
              },
            ),
            const Divider(),
            _buildTotalRow(invoice.total),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String t, String v) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(t, style: const TextStyle(fontWeight: FontWeight.bold)), Text(v)]),
  );

  Widget _buildTotalRow(double total) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text("إجمالي المشتريات:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      Text("$total ج.م", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
    ]),
  );
}