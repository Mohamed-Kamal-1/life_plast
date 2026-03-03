import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// تأكد من صحة هذه المسارات في مشروعك
import '../../../../ widgets/app_screen.dart';
import '../../../../ widgets/table_box.dart';
import '../../../../core/dimensions/Dimension_app.dart';
import '../../../logic/inventory_provider.dart'; // مسار ملف الـ Logic

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});
  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  // الكنترولرز لسحب البيانات من الـ Dialog
  final _codeCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _costCtrl = TextEditingController();
  final _saleCtrl = TextEditingController();
  final _qtyCtrl = TextEditingController();

  // ميثود الحفظ باستخدام اللوجيك المنفصل
  void _saveItem() {
    if (_nameCtrl.text.isNotEmpty) {
      // هنا بنستخدم InventoryItem اللي متعرف في ملف الـ logic فقط
      final newItem = InventoryItem(
        code: _codeCtrl.text,
        name: _nameCtrl.text,
        costPrice: double.tryParse(_costCtrl.text) ?? 0.0,
        salePrice: double.tryParse(_saleCtrl.text) ?? 0.0,
        quantity: double.tryParse(_qtyCtrl.text) ?? 0.0,
      );

      // الوصول للبروفايدر وتنفيذ الإضافة للمخزن
      Provider.of<InventoryProvider>(context, listen: false).addItemToInventory(newItem);

      _clearControllers();
      Navigator.pop(context); // إغلاق الدايلوج
    }
  }

  void _clearControllers() {
    _codeCtrl.clear();
    _nameCtrl.clear();
    _costCtrl.clear();
    _saleCtrl.clear();
    _qtyCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    // مراقبة التغييرات في اللوجيك (عشان الجدول يتحدث لوحده)
    final provider = Provider.of<InventoryProvider>(context);

    return AppScreen(
      title: "إدارة المخزن",
      child: Column(
        children: [
          _buildTopBar(),
          const SizedBox(height: Dimension.heightSizeBox12), // استخدام الابعاد من Core
          Expanded(
            child: TableBox(
              child: _buildDataTable(provider),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: _showAddDialog,
          icon: const Icon(Icons.add),
          label: const Text("إضافة صنف جديد"),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade900,
              foregroundColor: Colors.white
          ),
        ),
      ],
    );
  }

  Widget _buildDataTable(InventoryProvider provider) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('الكود')),
            DataColumn(label: Text('الصنف')),
            DataColumn(label: Text('سعر البيع')),
            DataColumn(label: Text('الكمية')),
            DataColumn(label: Text('إجراء')),
          ],
          // استخدام inventoryList المعرفة في البروفايدر
          rows: provider.inventoryList.map((item) => DataRow(cells: [
            DataCell(Text(item.code)),
            DataCell(Text(item.name)),
            DataCell(Text(item.salePrice.toString())),
            DataCell(Text(item.quantity.toString())),
            DataCell(Row(
              children: [
                // زر الإرسال للمبيعات (هنا الربط السحري)
                IconButton(
                  tooltip: "إرسال للفاتورة",
                  icon: const Icon(Icons.add_shopping_cart, color: Colors.blue),
                  onPressed: () {
                    provider.addToInvoice(item); // استدعاء دالة الاضافة للفاتورة
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("تم إرسال ${item.name} للمبيعات"))
                    );
                  },
                ),
                IconButton(
                  tooltip: "حذف من المخزن",
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // ميثود الحذف من المخزن في البروفايدر
                    // provider.deleteFromInventory(item); // لو فعلتها في اللوجيك ضيفها هنا
                  },
                ),
              ],
            )),
          ])).toList(),
        ),
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("بيانات الصنف الجديد"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildField(_codeCtrl, "الكود"),
              _buildField(_nameCtrl, "اسم الصنف"),
              _buildField(_costCtrl, "سعر التكلفة", isNum: true),
              _buildField(_saleCtrl, "سعر البيع", isNum: true),
              _buildField(_qtyCtrl, "الكمية المتاحة", isNum: true),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
          ElevatedButton(onPressed: _saveItem, child: const Text("حفظ في المخزن")),
        ],
      ),
    );
  }

  // ويدجت مساعدة لبناء الحقول بسرعة وبنفس التصميم
  Widget _buildField(TextEditingController ctrl, String label, {bool isNum = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: ctrl,
        keyboardType: isNum ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
      ),
    );
  }
}