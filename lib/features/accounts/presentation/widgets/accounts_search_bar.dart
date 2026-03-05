import 'package:flutter/material.dart';

import '../../../../core/app_text/accounts_text/account_screen_text.dart';

class AccountsSearchBar extends StatelessWidget {
  const AccountsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: AccountsStrings.searchHint,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}