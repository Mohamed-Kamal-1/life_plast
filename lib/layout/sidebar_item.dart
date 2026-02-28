import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  // final IconData icon;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.title,
    // required this.selected,
    required this.onTap,
    required bool isActive,
    required IconData icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // selected: selected,
      selectedTileColor: Colors.white12,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}
