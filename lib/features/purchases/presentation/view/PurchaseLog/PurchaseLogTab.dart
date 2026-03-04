import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../sales/presentation/view/invoice/Invoices_Log/Date_Range_Filter_Section.dart';


class PurchaseLogTab extends StatelessWidget {
  const PurchaseLogTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // بار الفلترة بالتاريخ (نفس كلاس السيلز لكن للمشتريات)
          DateRangeFilterSection(),

          SizedBox(height: 25),

          Text("سجل فواتير المشتريات", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
          PurchaseListView(isReturn: false),

          SizedBox(height: 30),
          Divider(thickness: 2),

          Text("سجل مرتجعات المشتريات", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange)),
          PurchaseListView(isReturn: true),
        ],
      ),
    );
  }
}

class PurchaseListView extends StatelessWidget {
  final bool isReturn;
  const PurchaseListView({super.key, required this.isReturn});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          leading: Icon(isReturn ? Icons.assignment_return : Icons.shopping_cart, color: isReturn ? Colors.orange : Colors.green),
          title: Text("${isReturn ? "مرتجع" : "شراء"} رقم: #PUR-00$index"),
          subtitle: const Text("المورد: مصنع الشرق | طريقة الدفع: نقدي | التاريخ: 2024-03-04"),
          trailing: const Text("12,000 ج.م", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}