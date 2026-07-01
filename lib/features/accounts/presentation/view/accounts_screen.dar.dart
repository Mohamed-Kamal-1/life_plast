import 'package:accounting_desktop/core/di/di.dart';
import 'package:accounting_desktop/features/accounts/presentation/view/tabs/employees_tab/employees_tab.dart';
import 'package:accounting_desktop/features/accounts/presentation/view/tabs/representative/representative_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_text/accounts_text/account_screen_text.dart';
import '../view_model/cubit/Account_Cubit.dart';
import 'tabs/customers/customers_tab.dart';
import 'tabs/suppliers/suppliers_tab.dart';

class AccountsScreen extends StatelessWidget {
  static const String customer = 'customer';
  static const String supplier = 'supplier';
  static const String employee = 'employee';
  static const String representative = 'representative';
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AccountsStrings.mainTitle),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                  icon: Icon(Icons.people_alt),
                  text: AccountsStrings.customersTab),
              Tab(
                  icon: Icon(Icons.business_center),
                  text: AccountsStrings.suppliersTab),
              Tab(icon: Icon(Icons.badge), text: AccountsStrings.employeesTab),
              Tab(
                  icon: Icon(Icons.directions_run),
                  text: AccountsStrings.repsTab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              child: CustomersTab(),
              create: (context) =>
                  getIt.get<AccountsCubit>()..loadAccounts(customer),
            ),
            BlocProvider(
              child: SuppliersTab(),
              create: (context) =>
                  getIt.get<AccountsCubit>()..loadAccounts(supplier),
            ),
            BlocProvider(
              child: EmployeesTab(),
              create: (context) =>
                  getIt.get<AccountsCubit>()..loadAccounts(employee),
            ),
            BlocProvider(
              child: RepresentativeTab(),
              create: (context) =>
                  getIt.get<AccountsCubit>()..loadAccounts(representative),
            ),
          ],
        ),
      ),
    );
  }
}
