import 'package:flutter/material.dart';

import '../../ widgets/table_box.dart';
import '../../core/app_text/employees_text/employees_screen_text.dart';

class EmployeesListTab extends StatelessWidget {
  const EmployeesListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TableBox(
      child: DataTable(
        columns: const [
          DataColumn(label: Text(EmployeesScreenText.colName)), // الاسم
          DataColumn(label: Text(EmployeesScreenText.colJob)), // الوظيفة
          DataColumn(label: Text(EmployeesScreenText.colSalary)), // الراتب
          DataColumn(label: Text(EmployeesScreenText.colStatus)),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('أحمد علي')),
            DataCell(Text('محاسب')),
            DataCell(Text('6,000')),
            DataCell(Text('نشط')),
          ]),
        ],
      ),
    );
  }
}
