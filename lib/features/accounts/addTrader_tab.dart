import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ widgets/action_button.dart';
import '../../core/app_text/accounts_text/account_screen_text.dart';
import '../../core/dimensions/Dimension_app.dart';

class AddTraderTab extends StatelessWidget {
  const AddTraderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: AccountsScreenText.labelTraderName))),
              SizedBox(width: Dimension.widthSizeBox16),
              Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: AccountsScreenText.labelTraderType))),
            ],
          ),
          const SizedBox(height: Dimension.heightSizeBox16),
          Row(
            children: const [
              Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: AccountsScreenText.labelPhone))),
              SizedBox(width: Dimension.widthSizeBox16),
              Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: AccountsScreenText.labelAddress))),
            ],
          ),
          const SizedBox(height: Dimension.heightSizeBox20),
          const ActionButton(
              title: AccountsScreenText.btnSaveTrader, icon: Icons.save),
        ],
      ),
    );
  }
}