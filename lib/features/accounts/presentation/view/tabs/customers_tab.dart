import 'package:flutter/material.dart';
import '../../../../../core/app_text/accounts_text/account_screen_text.dart';
import '../../widgets/accounts_search_bar.dart';
import '../../widgets/accounts_data_table.dart';

class CustomersTab extends StatelessWidget {
  const CustomersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. شريط البحث (مربوط بكلاس البحث العام)
          const AccountsSearchBar(),

          const SizedBox(height: 15),

          // 2. زر إضافة عميل/تاجر جديد
          const AddCustomerButton(),

          const SizedBox(height: 20),

          // 3. جدول بيانات العملاء
          const CustomersDataTable(),
        ],
      ),
    );
  }
}

// كلاس مستقل لزر إضافة العميل
class AddCustomerButton extends StatelessWidget {
  const AddCustomerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal, // لون أخضر مزرق للعملاء (رمز للبيع والربح)
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        // سيقوم بفتح Dialog إضافة عميل
      },
      icon: const Icon(Icons.person_add_alt_1),
      label: const Text(AccountsStrings.addCustomer),
    );
  }
}

// كلاس جدول العملاء المتجاوب
class CustomersDataTable extends StatelessWidget {
  const CustomersDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountsDataTable(
      headerColor: Color(0xFFE0F2F1), // لون هيدر متناسق مع زر الإضافة
      columns: [
        AccountsStrings.name,  // اسم التاجر
        AccountsStrings.city,  // المدينة
        AccountsStrings.phone, // الهاتف
        "إجمالي المسحوبات",    // عمود إضافي لإحصائيات العميل
        "حذف",                 // إجراء الحذف
      ],
    );
  }
}