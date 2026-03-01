import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation_controller.dart';
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
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // استبدال withOpacity بـ withValues
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const MenuToggleButton(), // الكلاس المنفصل للزرار
          const Text(
            appTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Text(permissionTitle),
        ],
      ),
    );
  }
}

// كلاس منفصل لزرار القائمة (Responsive Menu Button)
class MenuToggleButton extends StatelessWidget {
  const MenuToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 1000;
    if (!isMobile) return const SizedBox.shrink();

    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        // الوصول للـ scaffoldKey من الـ NavigationController بتاعك
        context.read<NavigationController>().scaffoldKey.currentState?.openDrawer();
      },
    );
  }
}