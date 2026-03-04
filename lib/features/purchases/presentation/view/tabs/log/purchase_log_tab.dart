import 'package:flutter/material.dart';

import '../../../../../../core/app_text/purchases_text/purchases_screen_text.dart';
import '../../../widgets/custom_purchase_fields.dart';


class PurchaseLogTab extends StatelessWidget {
  const PurchaseLogTab({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    bool isDesktop = w > 600;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 20,
                runSpacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                      width: isDesktop ? 200 : double.infinity,
                      child: const PurchaseTextField(
                          label: PurchaseStrings.fromDate,
                          icon: Icons.date_range)),
                  SizedBox(
                      width: isDesktop ? 200 : double.infinity,
                      child: const PurchaseTextField(
                          label: PurchaseStrings.toDate,
                          icon: Icons.date_range)),
                  ElevatedButton(
                      onPressed: () {}, child: const Icon(Icons.search)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const PurchaseLogList(title: "سجل المشتريات", color: Colors.green),
          const Divider(height: 40),
          const PurchaseLogList(title: "سجل المرتجعات", color: Colors.red),
        ],
      ),
    );
  }
}

class PurchaseLogList extends StatelessWidget {
  final String title;
  final Color color;

  const PurchaseLogList({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) => const Card(
              child: ListTile(
                  title: Text("فاتورة رقم #001"),
                  subtitle: Text("المورد: مصنع الأمل"))),
        ),
      ],
    );
  }
}
