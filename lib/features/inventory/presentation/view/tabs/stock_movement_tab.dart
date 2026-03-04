import 'package:flutter/material.dart';
import '../../ widgets/inventory_table.dart';
import '../../../../../core/app_text/inventory_text/inventory_screen_text.dart';


class StockMovementTab extends StatelessWidget {
  const StockMovementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          // يمكن إضافة فلترة هنا بالصنف أو التاريخ
          Expanded(
            child: InventoryDataTable(
              headerColor: Color(0xFFFFF3E0),
              columns: [
                InventoryStrings.moveDate,
                InventoryStrings.productName,
                InventoryStrings.moveType, // بيع، شراء، مرتجع، تسوية
                InventoryStrings.moveRef,  // رقم الفاتورة
                InventoryStrings.moveQty,
                InventoryStrings.moveBalance,
              ],
            ),
          ),
        ],
      ),
    );
  }
}