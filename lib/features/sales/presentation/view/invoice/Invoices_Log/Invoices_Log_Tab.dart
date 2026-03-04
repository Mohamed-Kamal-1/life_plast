import 'package:flutter/material.dart';

import 'Date_Range_Filter_Section.dart';

class InvoicesLogTab extends StatelessWidget {
  const InvoicesLogTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          DateRangeFilterSection(),
          Text("فواتير البيع",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          SizedBox(height: 10),
          InvoicesListView(isReturn: false),
          Divider(height: 40),
          Text("فواتير مرتجع البيع",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          SizedBox(height: 10),
          InvoicesListView(isReturn: true),
        ],
      ),
    );
  }
}

class InvoicesListView extends StatelessWidget {
  final bool isReturn;

  const InvoicesListView({super.key, required this.isReturn});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          leading: Icon(isReturn ? Icons.assignment_return : Icons.description,
              color: isReturn ? Colors.red : Colors.blue),
          title: Text("فاتورة رقم: #INV-100$index"),
          subtitle: const Text("التاجر: شركة الأمل - المندوب: محمد"),
          trailing: const Text("2,500 ج.م"),
        ),
      ),
    );
  }
}
