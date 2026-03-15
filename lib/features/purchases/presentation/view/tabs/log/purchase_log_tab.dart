import 'package:accounting_desktop/features/purchases/presentation/view/tabs/log/purchase_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../all_data_service/data/models/product_model.dart';

class PurchasesLogTab extends StatefulWidget {
  const PurchasesLogTab({super.key, required String invoiceTitleButton});

  @override
  State<PurchasesLogTab> createState() => _PurchasesLogTabState();
}

class _PurchasesLogTabState extends State<PurchasesLogTab> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final service = getIt.get<ProductService>();
    final filtered = service.allSavedLogPurchaseInvoices.where((inv) {
      return inv.customerName.contains(searchQuery) || inv.id.contains(searchQuery);
    }).toList().reversed.toList(); // الأحدث أولاً

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "ابحث في المشتريات (رقم أو مورد)...",
              prefixIcon: const Icon(Icons.search, color: Colors.green),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onChanged: (v) => setState(() => searchQuery = v),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final inv = filtered[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: ListTile(
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (_) => PurchaseDetailsScreen(invoice: inv))),
                  leading: const Icon(Icons.inventory_2, color: Colors.green),
                  title: Text("فاتورة شراء رقم: #${inv.id}"),
                  subtitle: Text("المورد: ${inv.customerName} - ${inv.date}"),
                  trailing: Text("${inv.total} ج.م", style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}