import 'package:flutter/material.dart';

import '../core/colors/app_color.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  const SidebarItem({
    super.key,
    required this.title,
    required this.onTap,
    required bool isActive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      selectedTileColor: AppColor.selectionColor,
      title: Text(
        title,
        style: const TextStyle(color: AppColor.white),
      ),
      onTap: onTap,
    );
  }
}
