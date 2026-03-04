import 'package:accounting_desktop/%20screens/accounts/trader_accounts_tab.dart';
import 'package:accounting_desktop/%20screens/accounts/tradersList_tab.dart';
import 'package:accounting_desktop/core/dimensions/Dimension_app.dart';
import 'package:flutter/material.dart';

import '../../ widgets/app_screen.dart';
import '../../core/app_text/accounts_text/account_screen_text.dart';
import 'addTrader_tab.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: AccountsScreenText.screenTitle,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: AccountsScreenText.tabViewTraders),
              Tab(text: AccountsScreenText.tabAddTrader),
              Tab(text: AccountsScreenText.tabAccounts),
            ],
          ),
          const SizedBox(height: Dimension.heightSizeBox16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TradersListTab(),
                AddTraderTab(),
                TraderAccountsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
