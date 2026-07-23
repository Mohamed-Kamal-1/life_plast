import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SidebarListTile extends StatelessWidget {
  final dynamic item;
  final bool isActive;

  const SidebarListTile({
    super.key,
    required this.item,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        item.icon,
        color: isActive ? Colors.blue : Colors.grey,
      ),
      title: Text(
        item.title,
        style: TextStyle(
          color: isActive ? Colors.blue : Colors.black87,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isActive,
      selectedTileColor: Colors.blue.withValues(alpha: 0.1),
      onTap: () {
        if (!isActive) {
          context.go(item.route);
        }
      },
    );
  }
}
