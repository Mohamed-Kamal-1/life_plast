import 'package:accounting_desktop/screens/employees/representatives_list_tab.dart';
import 'package:flutter/material.dart';

import '../../ widgets/app_screen.dart';
import '../../core/app_text/employees_text/employees_screen_text.dart';
import 'add_employee_tab.dart';
import 'employees_list_tab.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen>
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
      title: EmployeesScreenText.screenTitle,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: EmployeesScreenText.tabEmployees),
              Tab(text: EmployeesScreenText.tabRepresentatives),
              Tab(text: EmployeesScreenText.tabAdd),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                EmployeesListTab(),
                RepresentativesListTab(),
                AddEmployeeTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


