import 'package:flutter/material.dart';

import '../../ widgets/table_box.dart';

class RepresentativesListTab extends StatelessWidget {
  const RepresentativesListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TableBox(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('الاسم')),
          DataColumn(label: Text('المنطقة')),
          DataColumn(label: Text('العمولة')),
          DataColumn(label: Text('الحالة')),
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
