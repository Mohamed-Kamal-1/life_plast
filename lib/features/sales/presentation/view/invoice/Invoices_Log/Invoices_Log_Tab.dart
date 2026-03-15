import 'package:flutter/material.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../all_data_service/data/models/product_model.dart';
import 'Invoice_Details_Screen.dart';

class InvoicesLogTab extends StatefulWidget {
  const InvoicesLogTab({super.key});

  @override
  State<InvoicesLogTab> createState() => _InvoicesLogTabState();
}

class _InvoicesLogTabState extends State<InvoicesLogTab> {
  String searchQuery = '';
  bool isReturnMode = false; // التبديل بين مبيعات ومرتجع

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // --- الجزء الأول: اختيار النوع (Chips) ---
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: const Text("سجل المبيعات"),
                selected: !isReturnMode,
                onSelected: (val) => setState(() => isReturnMode = false),
                selectedColor: Colors.blue.withValues(alpha: 0.2),
              ),
              const SizedBox(width: 12),
              ChoiceChip(
                label: const Text("سجل المرتجعات"),
                selected: isReturnMode,
                onSelected: (val) => setState(() => isReturnMode = true),
                selectedColor: Colors.red.withValues(alpha: 0.2),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // --- الجزء الثاني: حقل البحث ---
          TextField(
            decoration: InputDecoration(
              hintText:
                  isReturnMode ? "ابحث في المرتجعات..." : "ابحث في المبيعات...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
          const SizedBox(height: 24),

          // --- الجزء الثالث: عرض القائمة المفلترة ---
          InvoicesListView(
            isReturn: isReturnMode,
            searchQuery: searchQuery,
          ),
        ],
      ),
    );
  }
}

class InvoicesListView extends StatelessWidget {
  final bool isReturn;
  final String searchQuery;

  const InvoicesListView({
    super.key,
    required this.isReturn,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    final service = getIt.get<ProductService>();

    // 1. اختيار المصدر الصحيح للداتا
    final targetList = isReturn
        ? service.allSavedSalesReturnLogInvoices
        : service.allSavedSalesLogInvoices;

    // 2. تطبيق فلتر البحث
    final filteredInvoices = targetList.where((inv) {
      final query = searchQuery.toLowerCase();
      return inv.customerName.toLowerCase().contains(query) ||
          inv.id.toLowerCase().contains(query);
    }).toList();

    // 3. عرض حالة "لا توجد نتائج"
    if (filteredInvoices.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text(
            "لا توجد نتائج تطابق بحثك",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      );
    }

    final Color themeColor = isReturn ? Colors.red : Colors.blue;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // لأننا داخل SingleChildScrollView
      itemCount: filteredInvoices.length,
      itemBuilder: (context, index) {
        final inv = filteredInvoices[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey[200]!),
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InvoiceDetailsScreen(invoice: inv),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundColor: themeColor.withValues(alpha: 0.1),
              child: Icon(
                isReturn ? Icons.assignment_return : Icons.description,
                color: themeColor,
              ),
            ),
            title: Text(
              "فاتورة ${isReturn ? 'مرتجع' : 'بيع'} رقم: #${inv.id}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text("العميل: ${inv.customerName}"),
                Text("التاريخ: ${inv.date}",
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${inv.total} ج.م",
                  style: TextStyle(
                    color: themeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // أيقونة الحذف لو حبيت تمسح فاتورة واحدة
                // IconButton(icon: Icon(Icons.delete_outline, size: 20), onPressed: () => _showDeleteDialog(context, inv.id))
              ],
            ),
          ),
        );
      },
    );
  }
}