import 'package:flutter/material.dart';
import '../core/colors/app_color.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final bool isActive;

  const SidebarItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.7),
      ),
      selected: isActive,
      selectedTileColor: AppColor.selectionColor,
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.9),
        ),
      ),
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
    );
  }
}