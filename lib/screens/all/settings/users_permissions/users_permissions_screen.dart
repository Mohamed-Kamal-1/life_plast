import 'package:flutter/material.dart';

import 'users_table.dart';
import 'permissions_matrix.dart';
import 'role_summary_card.dart';

class UsersPermissionsScreen extends StatelessWidget {
  const UsersPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: const [
          Expanded(
            flex: 2,
            child: UsersTable(),
          ),
          SizedBox(width: 12),
          Expanded(
            flex: 4,
            child: PermissionsMatrix(),
          ),
          SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: RoleSummaryCard(),
          ),
        ],
      ),
    );
  }
}