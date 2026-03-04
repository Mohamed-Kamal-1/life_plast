import 'package:flutter/material.dart';

import '../../../../../../core/app_text/purchases_text/purchases_screen_text.dart';
import '../../../widgets/add_product_dialog.dart';
import '../../../widgets/custom_purchase_fields.dart';
import '../../../widgets/purchase_data_table.dart';



class PurchaseInvoiceTab extends StatelessWidget {
  const PurchaseInvoiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    bool isDesktop = w > 900;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // القسم الأول: رأس الفاتورة
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              // حقل التاريخ (تم تعديله ليفتح التقويم فوراً)
              SizedBox(
                  width: isDesktop ? 200 : double.infinity,
                  child: const PurchaseDatePickerField()),
              SizedBox(
                  width: isDesktop ? 200 : double.infinity,
                  child: const PurchaseTextField(
                      label: PurchaseStrings.invoiceNo)),
              SizedBox(
                  width: isDesktop ? 300 : double.infinity,
                  child: const PurchaseTextField(
                      label: PurchaseStrings.supplierName,
                      icon: Icons.business)),
              SizedBox(
                  width: isDesktop ? 200 : double.infinity,
                  child: const PurchaseDropdownField()),
              SizedBox(
                  width: isDesktop ? 200 : double.infinity,
                  child: const PurchaseTextField(
                      label: PurchaseStrings.supplierInvNo)),
              SizedBox(
                  width: isDesktop ? 632 : double.infinity,
                  child: const PurchaseTextField(
                      label: PurchaseStrings.notes, maxLines: 2)),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(thickness: 2),
          ),

          // القسم الثاني: البحث وإضافة صنف جديد (طلبك)
          Row(
            children: [
              const Expanded(
                child: PurchaseTextField(
                    label: PurchaseStrings.searchProduct, icon: Icons.search),
              ),
              const SizedBox(width: 10),
              // زر إضافة صنف جديد سريع في المخزن
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddProductDialog(),
                  );
                },
                icon: const Icon(Icons.add_box),
                label: const Text("صنف جديد"),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // الجدول (فاضي حالياً)
          const PurchaseDataTable(headerColor: Color(0xFFE8F5E9)),

          const SizedBox(height: 30),

          // القسم الثالث: حفظ الفاتورة
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(250, 60),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {},
              icon: const Icon(Icons.save_as),
              label: const Text(PurchaseStrings.savePurchase),
            ),
          ),
        ],
      ),
    );
  }
}

// كلاس مستقل لاختيار التاريخ (Date Picker) لضمان عدم تكرار الكود
class PurchaseDatePickerField extends StatelessWidget {
  const PurchaseDatePickerField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: const InputDecoration(
        labelText: PurchaseStrings.date,
        prefixIcon: Icon(Icons.calendar_month),
        border: OutlineInputBorder(),
      ),
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );
      },
    );
  }
}
