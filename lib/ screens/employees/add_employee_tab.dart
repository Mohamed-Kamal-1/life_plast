import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ widgets/action_button.dart';


class AddEmployeeTab extends StatelessWidget {
  const AddEmployeeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'الاسم'))),
              SizedBox(width: 16),
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'الوظيفة'))),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'الراتب / العمولة'))),
              SizedBox(width: 16),
              Expanded(child: TextField(decoration: InputDecoration(labelText: 'رقم الهاتف'))),
            ],
          ),
          const SizedBox(height: 20),
          const ActionButton(title: 'حفظ', icon: Icons.save),
        ],
      ),
    );
  }
}