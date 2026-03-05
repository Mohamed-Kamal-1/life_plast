import 'package:flutter/material.dart';
import '../../../../../core/app_text/accounts_text/account_screen_text.dart';
import '../../widgets/accounts_search_bar.dart';
import '../../widgets/accounts_data_table.dart';

class SuppliersTab extends StatelessWidget {
  const SuppliersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. شريط البحث الخاص بالموردين
          const AccountsSearchBar(),

          const SizedBox(height: 15),

          // 2. زر إضافة مورد جديد
          const AddSupplierButton(),

          const SizedBox(height: 20),

          // 3. جدول بيانات الموردين المتجاوب
          const SuppliersDataTable(),
        ],
      ),
    );
  }
}

// كلاس مستقل لزر الإضافة لسهولة التحكم في الأكشن
class AddSupplierButton extends StatelessWidget {
  const AddSupplierButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        // هنا سيتم فتح نافذة إضافة مورد جديد لاحقاً
      },
      icon: const Icon(Icons.business_outlined),
      label: const Text(AccountsStrings.addSupplier),
    );
  }
}

// كلاس الجدول الخاص بالموردين
class SuppliersDataTable extends StatelessWidget {
  const SuppliersDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountsDataTable(
      headerColor: Color(0xFFE8EAF6), // لون مميز للموردين (أزرق فاتح جداً)
      columns: [
        AccountsStrings.name,    // اسم المورد / الشركة
        AccountsStrings.city,    // المدينة
        AccountsStrings.phone,   // الهاتف
        "الرصيد",                // مديونية المورد
        "حذف",                   // زر الحذف
      ],
    );
  }
}