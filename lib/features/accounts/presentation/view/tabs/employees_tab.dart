// مثال لتبويب الموظفين (EmployeesTab)
import 'package:flutter/cupertino.dart';

import '../../../../../core/app_text/accounts_text/account_screen_text.dart';
import '../../widgets/accounts_data_table.dart';
import '../../widgets/accounts_search_bar.dart';

class EmployeesTab extends StatelessWidget {
  const EmployeesTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          AccountsSearchBar(),
          SizedBox(height: 20),
          AccountsDataTable(
            headerColor: Color(0xFFEFEBE9),
            columns: [
              AccountsStrings.name,
              AccountsStrings.specialty,
              AccountsStrings.phone,
              AccountsStrings.city,
              "حذف"
            ],
          ),
        ],
      ),
    );
  }
}