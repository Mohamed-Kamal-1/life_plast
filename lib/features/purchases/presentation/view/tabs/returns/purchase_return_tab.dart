// import 'package:flutter/material.dart';
//
// import '../../../../../../core/app_text/purchases_text/purchases_screen_text.dart';
// import '../../../widgets/custom_purchase_fields.dart';
// import '../../../widgets/purchase_data_table.dart';
//
//
// class PurchaseReturnTab extends StatelessWidget {
//   const PurchaseReturnTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.sizeOf(context).width;
//     bool isDesktop = w > 900;
//
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           Wrap(
//             spacing: 16, runSpacing: 16,
//             children: [
//               SizedBox(width: isDesktop ? 200 : double.infinity, child: const PurchaseTextField(label: PurchaseStrings.date, icon: Icons.calendar_month)),
//               SizedBox(width: isDesktop ? 300 : double.infinity, child: const PurchaseTextField(label: PurchaseStrings.supplierName, icon: Icons.business)),
//               SizedBox(width: isDesktop ? 200 : double.infinity, child: const PurchaseDropdownField()),
//               SizedBox(width: isDesktop ? 632 : double.infinity, child: const PurchaseTextField(label: PurchaseStrings.notes, maxLines: 2)),
//             ],
//           ),
//           const SizedBox(height: 20),
//           const PurchaseDataTable(headerColor: Color(0xFFFFEBEE)),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white, minimumSize: const Size(200, 50)),
//             onPressed: () {},
//             child: const Text(PurchaseStrings.saveReturn),
//           ),
//         ],
//       ),
//     );
//   }
// }