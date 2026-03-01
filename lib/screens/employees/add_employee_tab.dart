import 'package:flutter/material.dart';
import 'package:accounting_desktop/core/dimensions/Dimension_app.dart'; // تأكد من المسار
import '../../ widgets/action_button.dart';
import '../../core/app_text/employees_text/employees_screen_text.dart'; // كلاس النصوص

class AddEmployeeTab extends StatelessWidget {
  const AddEmployeeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Dimension.padding16), // إضافة Padding للحاوية
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: EmployeesScreenText.colName),
                ),
              ),
              SizedBox(width: Dimension.widthSizeBox16), // استخدام Dimension
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: EmployeesScreenText.colJob),
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimension.heightSizeBox16), // استخدام Dimension
          Row(
            children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: EmployeesScreenText.labelSalaryCommission),
                ),
              ),
              SizedBox(width: Dimension.widthSizeBox16), // استخدام Dimension
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: EmployeesScreenText.labelPhone),
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimension.heightSizeBox20), // استخدام Dimension
          const ActionButton(
            title: EmployeesScreenText.btnSave,
            icon: Icons.save,
          ),
        ],
      ),
    );
  }
}