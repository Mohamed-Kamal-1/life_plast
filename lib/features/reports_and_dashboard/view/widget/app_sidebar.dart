import 'package:accounting_desktop/features/reports_and_dashboard/view/widget/sidebar_listTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/menu_items.dart'; // تأكد من مسار الاستدعاء الخاص بك
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    // السايدبار يراقب المسار بشكل مستقل
    final currentRoute = GoRouterState.of(context).uri.path;

    final authState = context.watch<AuthCubit>().state;

    if (authState is! AuthSuccess) {
      return const SizedBox(
        width: 250,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final String userRole = authState.user.role;
    final allowedItems =
        appMenuItems.where((item) => item.roles.contains(userRole)).toList();

    return Material(
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          const _SidebarHeader(), // معزول لمنع إعادة بنائه
          Expanded(
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
          ),
          const Divider(),
          const ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'تسجيل الخروج',
              style: TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _SidebarHeader extends StatelessWidget {
  const _SidebarHeader();

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.business, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(
              'نظام الإدارة',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
