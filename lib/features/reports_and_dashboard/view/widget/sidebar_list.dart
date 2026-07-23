import 'package:accounting_desktop/features/reports_and_dashboard/view/widget/sidebar_listTile.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/menu_items.dart';

class SidebarList extends StatelessWidget {
  final allowedItems =
      appMenuItems.where((item) => item.roles.contains(userRole)).toList();
  const SidebarList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: allowedItems.length,
        itemBuilder: (context, index) {
          final item = allowedItems[index];
          final isActive = currentRoute == item.route;

          return SidebarListTile(
            key: ValueKey(item.route),
            item: item,
            isActive: isActive,
          );
        },
      ),
    );
  }
}
