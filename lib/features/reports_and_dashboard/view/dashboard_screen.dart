import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: Row(
        children: [
          // ==================== 1. القائمة الجانبية (Sidebar) ====================
          Container(
            width: 240,
            color: const Color(0xFF2C3E50),
            child: Column(
              children: [
                const DrawerHeader(
                  child: Center(
                    child: Text(
                      'لايف بلاست',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.dashboard, color: Colors.white70),
                  title: const Text('لوحة التحكم',
                      style: TextStyle(color: Colors.white70)),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet,
                      color: Colors.white),
                  title: const Text('الخزينة والسيولة',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  selected: true,
                  selectedTileColor: Colors.white10,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.receipt, color: Colors.white70),
                  title: const Text('الفواتير',
                      style: TextStyle(color: Colors.white70)),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.inventory, color: Colors.white70),
                  title: const Text('المخزن',
                      style: TextStyle(color: Colors.white70)),
                  onTap: () {},
                ),
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: const Text('تسجيل الخروج',
                      style: TextStyle(color: Colors.redAccent)),
                  onTap: () {},
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),

          // ==================== 2. محتوى الخزنة الرئيسي (Dashboard) ====================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الهيدر وزر الإيداع
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'داشبورد الخزنة والسيولة',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3E50)),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => _openAddModal(context),
                        icon: const Icon(Icons.add),
                        label: const Text('إيداع مبالغ إضافية'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2ECC71),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // كارت الفلاتر (التواريخ)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Text('من: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 10),
                        _buildDateInput('2026-07-01'),
                        const SizedBox(width: 20),
                        const Text('إلى: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 10),
                        _buildDateInput('2026-07-20'),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2C3E50)),
                          child: const Text('عرض النتائج',
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('شغل اليوم'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // العدادات والبطاقات الخمسة (Stats Grid)
                  Row(
                    children: [
                      _buildStatCard('تحصيلات السوق', '0.00',
                          const Color(0xFF2ECC71), Icons.handshake),
                      _buildStatCard('ماليات خاصة', '0.00',
                          const Color(0xFFF39C12), Icons.wallet),
                      _buildStatCard('مدفوعات موردين', '0.00',
                          const Color(0xFFE74C3C), Icons.local_shipping),
                      _buildStatCard('إجمالي المصروفات', '0.00',
                          const Color(0xFFE67E22), Icons.receipt),
                      _buildStatCard('صافي الخزينة', '0.00',
                          const Color(0xFF3498DB), Icons.account_balance,
                          isNet: true),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // جدول تفاصيل الحركة
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('تفاصيل حركة النقدية',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const Divider(),
                          const Expanded(
                            child: Center(
                              child: Text('جاري مزامنة البيانات...'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ودجت مساعد للبطاقات
  static Widget _buildStatCard(
      String title, String val, Color color, IconData icon,
      {bool isNet = false}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isNet ? const Color(0xFF2C3E50) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border(right: BorderSide(color: color, width: 5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 12,
                    color: isNet ? Colors.white70 : Colors.grey[700],
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(val,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isNet ? Colors.white : color)),
          ],
        ),
      ),
    );
  }

  // ودجت مساعد للتاريخ
  static Widget _buildDateInput(String dateText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(6)),
      child: Text(dateText),
    );
  }

  // نافذة الإيداع (Modal)
  void _openAddModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('إضافة سيولة يدوية'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(decoration: InputDecoration(labelText: 'المبلغ')),
            const SizedBox(height: 10),
            const TextField(decoration: InputDecoration(labelText: 'البيان')),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('إلغاء')),
          ElevatedButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('حفظ')),
        ],
      ),
    );
  }
}
