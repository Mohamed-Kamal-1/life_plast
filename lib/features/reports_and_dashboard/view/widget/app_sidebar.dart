import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/menu_items.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';

class AppSidebar extends StatelessWidget {
  final String currentRoute; // لمعرفة الصفحة الحالية وتظليلها

  const AppSidebar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        // إذا لم يكن المستخدم مسجلاً، لا تعرض القائمة أو أعده للـ Login
        if (state is! Authenticated) {
          return const SizedBox.shrink();
        }

        // استخراج الرول الخاص بالمستخدم من الـ Entity
        final String userRole = (state as Authenticated).userEntity.role;

        // فلترة العناصر بناءً على الرول
        final allowedItems = appMenuItems
            .where((item) => item.roles.contains(userRole))
            .toList();

        return Container(
          width: 250,
          color: Theme.of(context).cardColor,
          child: Column(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.business, size: 40, color: Colors.blue),
                      SizedBox(height: 10),
                      Text(
                        'نظام الإدارة',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: allowedItems.length,
                  itemBuilder: (context, index) {
                    final item = allowedItems[index];
                    final isActive = currentRoute == item.route;

                    return ListTile(
                      leading: Icon(item.icon,
                          color: isActive ? Colors.blue : Colors.grey),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          color: isActive ? Colors.blue : Colors.black87,
                          fontWeight:
                              isActive ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      selected: isActive,
                      selectedTileColor: Colors.blue.withOpacity(0.1),
                      onTap: () {
                        if (!isActive) {
                          // استخدام pushReplacement لمنع تراكم الشاشات في الـ Stack
                          Navigator.pushReplacementNamed(context, item.route);
                        }
                      },
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('تسجيل الخروج',
                    style: TextStyle(color: Colors.red)),
                // onTap: () {
                //   context.read<AuthCubit>().logout();
                //   Navigator.pushReplacementNamed(context, '/login');
                // },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
