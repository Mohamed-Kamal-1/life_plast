import 'package:flutter/material.dart';

import '../../../../../core/app_text/sales_text/sales_screen_text.dart';
import '../../../../../core/dimensions/Dimension_app.dart';
// تأكد من عمل import لملف الـ Dimensions والـ Strings الخاص بك
// import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';

class InvoiceItemsTable extends StatelessWidget {
  const InvoiceItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimension.circular12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // للتمرير العرضي في الموبايل
            child: ConstrainedBox(
              constraints: BoxConstraints(
                // يضمن أن الجدول يملأ المساحة لو الشاشة كبيرة (كمبيوتر)
                minWidth: constraints.maxWidth,
              ),
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(Colors.grey.shade50),
                columnSpacing: Dimension.spacing20, // استخدام الـ Dimension الخاص بك
                horizontalMargin: Dimension.padding12,
                columns: [
                  DataColumn(label: Text(SalesStrings.columnProduct, style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(SalesStrings.columnQuantity, style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(SalesStrings.columnPrice, style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(SalesStrings.columnTotal, style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(SalesStrings.columnDelete, style: const TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: const [], // سيتم ملؤها لاحقاً
              ),
            ),
          ),
        );
      },
    );
  }
}