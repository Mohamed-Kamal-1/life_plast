// import 'package:flutter/material.dart';
//
// import '../data/all_accounts.dart';
//
// class AccountsDataTable extends StatelessWidget {
//   // final List<AccountModel> data;
//   final Color headerColor;
//
//   const AccountsDataTable({super.key, required this.headerColor, required List<String> columns});
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minWidth: constraints.maxWidth),
//               child: DataTable(
//                 headingRowColor: WidgetStateProperty.all(headerColor),
//                 horizontalMargin: 20,
//                 columnSpacing: 40,
//                 columns: const [
//                   DataColumn(label: Text("الاسم", style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text("المدينة", style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text("الهاتف", style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataColumn(label: Text("الإجراءات", style: TextStyle(fontWeight: FontWeight.bold))),
//                 ], rows: [],
//                 // rows: data.map((acc) => DataRow(cells: [
//                 //   DataCell(Text(acc.name)),
//                 //   DataCell(Text(acc.city)),
//                 //   DataCell(Text(acc.phone)),
//                 //   DataCell(IconButton(icon: const Icon(Icons.delete, color: Colors.redAccent), onPressed: () {})),
//                 // ])).toList(),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }