import 'package:flutter/material.dart';
import '../../ widgets/inventory_table.dart';
import '../../../../../core/app_text/inventory_text/inventory_screen_text.dart';


class StockShortagesTab extends StatelessWidget {
  const StockShortagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AlertCard(), // تنبيه بصري بوجود نواقص
          const SizedBox(height: 15),
          const Expanded(
            child: InventoryDataTable(
              headerColor: Color(0xFFFFEBEE), // لون أحمر خفيف للتمييز
              columns: [
                InventoryStrings.productName,
                InventoryStrings.currentStock,
                "حد الطلب",
                "المورد الأساسي",
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  const AlertCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[100],
      child: const ListTile(
        leading: Icon(Icons.warning_amber_rounded, color: Colors.orange),
        title: Text(InventoryStrings.shortageNote, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}