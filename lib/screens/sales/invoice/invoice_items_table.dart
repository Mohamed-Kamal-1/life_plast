import 'package:flutter/material.dart';
import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';

class InvoiceItemsTable extends StatelessWidget {
  static const String _colCode = 'كود';
  static const String _colName = 'الصنف';
  static const String _colUnit = 'وحدة';
  static const String _colQty = 'كمية';
  static const String _colPrice = 'سعر';
  static const String _colDiscount = 'خصم %';
  static const String _colTax = 'ضريبة %';
  static const String _colTotal = 'إجمالي';

  const InvoiceItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    // جلب عرض الشاشة الحالي
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias, // عشان الحواف تكون ناعمة مع السكرول
      child: Theme(
        // تصغير حجم الـ Checkbox والـ Padding في الموبايل عشان نوفر مساحة
        data: Theme.of(context).copyWith(dividerColor: Colors.grey[200]),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // سكرول طولي للصفوف
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // سكرول عرضي للأعمدة (الحل السحري)
            child: ConstrainedBox(
              constraints: BoxConstraints(
                // في الموبايل بنجبر الجدول يفرش على الأقل 1000 بكسل عشان البيانات تبان
                minWidth: screenWidth < 600 ? 1000 : screenWidth - 100,
              ),
              child: DataTable(
                columnSpacing: Dimension.padding24, // مساحة محترمة بين الأعمدة
                headingRowColor: WidgetStateProperty.all(Colors.blueGrey[50]),
                columns: const [
                  DataColumn(label: Text(_colCode, style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(_colName, style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(_colUnit, style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(_colQty, style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(_colPrice, style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(_colDiscount, style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(_colTax, style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text(_colTotal, style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('')), // عمود الحذف
                ],
                rows: List.generate(6, (index) {
                  return DataRow(
                    cells: [
                      const DataCell(Text('IT-01')),
                      const DataCell(Text('منتج بلاستيك')),
                      const DataCell(Text('قطعة')),
                      // استخدام SizedBox مع TextField عشان نتحكم في عرض الخانة
                      DataCell(_buildTableField('0')),
                      DataCell(_buildTableField('0.0')),
                      DataCell(_buildTableField('0')),
                      DataCell(_buildTableField('14')),
                      const DataCell(Text('1,250', style: TextStyle(fontWeight: FontWeight.bold))),
                      const DataCell(Icon(Icons.delete_outline, color: Colors.redAccent, size: 20)),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget مساعد لبناء الخانات القابلة للإدخال بشكل منسق
  Widget _buildTableField(String hint) {
    return SizedBox(
      width: 60, // عرض ثابت للخانة عشان الجدول ميفلتش منك
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          border: const OutlineInputBorder(),
        ),
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}