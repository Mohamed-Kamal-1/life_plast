import 'package:flutter/material.dart';
import '../../../../data/models/invoice_item_model.dart';
import '../Invoice_Pdf_Helper/Invoice_Pdf_Helper.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  final InvoiceModel invoice;

  const InvoiceDetailsScreen({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفاصيل فاتورة #${invoice.id}"),
        actions: [
          // زر الطباعة و PDF في الـ AppBar لسهولة الوصول
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () => InvoicePdfHelper.printInvoice(invoice),
            tooltip: "طباعة / حفظ PDF",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // الكارت العلوي لبيانات العميل (الهيدر)
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow("العميل:", invoice.customerName),
                    _buildInfoRow("التاريخ:", invoice.date),
                    _buildInfoRow("المندوب:", invoice.repName),
                    _buildInfoRow("الهاتف:", invoice.phone),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // جدول المنتجات
            const Text("الأصناف المباعة", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: invoice.items.length,
              itemBuilder: (context, index) {
                final item = invoice.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("الكمية: ${item.quantity} × ${item.sellingPrice}"),
                  trailing: Text("${item.quantity * item.sellingPrice} ج.م"),
                );
              },
            ),
            const Divider(),
            // الإجمالي النهائي
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("الإجمالي النهائي:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("${invoice.total} ج.م", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
                ],
              ),
            ),
            // الأزرار الكبيرة في الأسفل
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => InvoicePdfHelper.saveAsPdf(invoice),
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text("حفظ PDF / طباعة"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red[700], foregroundColor: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}