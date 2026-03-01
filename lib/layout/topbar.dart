import 'package:flutter/material.dart';

import '../core/dimensions/Dimension_app.dart';

class TopBar extends StatelessWidget {
  static const String appTitle = 'Accounting System';
  static const String permissionTitle = 'Admin';
  const TopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.heightTabBar56,
      padding: const EdgeInsets.symmetric(horizontal: Dimension.padding16),
      color: Colors.white,
      child: Row(
        children: const [
          Text(
            appTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(permissionTitle),
        ],
      ),
    );
  }
}