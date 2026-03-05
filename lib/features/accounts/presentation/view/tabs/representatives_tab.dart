import 'package:flutter/material.dart';
import '../../../../../core/app_text/accounts_text/account_screen_text.dart';
import '../../widgets/accounts_search_bar.dart';
import '../../widgets/accounts_data_table.dart';

class RepresentativesTab extends StatelessWidget {
  const RepresentativesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AccountsSearchBar(),
          const SizedBox(height: 15),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.person_add),
              label: const Text(AccountsStrings.addRep)
          ),
          const SizedBox(height: 25),

          // القسم الأول: مناديب المعاينة
          const SectionTitle(title: AccountsStrings.inspectionRep, color: Colors.blueGrey),
          const AccountsDataTable(
            headerColor: Color(0xFFF0F4F8),
            columns: [AccountsStrings.name, AccountsStrings.city, AccountsStrings.phone, AccountsStrings.route, "حذف"],
          ),

          const SizedBox(height: 30),

          // القسم الثاني: مناديب البيع
          const SectionTitle(title: AccountsStrings.salesRep, color: Colors.indigo),
          const AccountsDataTable(
            headerColor: Color(0xFFE8EAF6),
            columns: [AccountsStrings.name, AccountsStrings.city, AccountsStrings.phone, AccountsStrings.route, "حذف"],
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;
  const SectionTitle({super.key, required this.title, required this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
    );
  }
}