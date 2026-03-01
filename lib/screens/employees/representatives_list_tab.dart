import 'package:flutter/material.dart';

import '../../ widgets/table_box.dart';
import '../../core/app_text/employees_text/employees_screen_text.dart';

class RepresentativesListTab extends StatelessWidget {
  const RepresentativesListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TableBox(
      child: DataTable(
        columns: const [
          DataColumn(label: Text(EmployeesScreenText.colName)),       // الاسم
          DataColumn(label: Text(EmployeesScreenText.colRegion)),     // المنطقة
          DataColumn(label: Text(EmployeesScreenText.colCommission)), // العمولة
          DataColumn(label: Text(EmployeesScreenText.colStatus)),     // الحالة
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('محمد حسن')),
            DataCell(Text('الدلتا')),
            DataCell(Text('5%')),
            DataCell(Text('نشط')),
          ]),
        ],
      ),
    );
  }
}
