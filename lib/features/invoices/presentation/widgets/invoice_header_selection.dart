import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_text/invoices_text/invoices_strings.dart';
import '../../../../core/dimensions/Dimension_app.dart';
import '../../../accounts/domain/entities/account_entity.dart';
import '../../../accounts/presentation/view_model/cubit/Account_Cubit.dart';
import '../../../accounts/presentation/view_model/cubit/Accounts_State.dart';

class InvoiceHeaderSelection extends StatelessWidget {
  final String accountType;
  final String? selectedAccountId;
  final String? selectedRepId;
  final ValueChanged<String?> onAccountChanged;
  final ValueChanged<String?> onRepChanged;

  const InvoiceHeaderSelection({
    super.key,
    required this.accountType,
    required this.selectedAccountId,
    required this.selectedRepId,
    required this.onAccountChanged,
    required this.onRepChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<AccountCubit, AccountState>(
            builder: (context, state) {
              List<AccountEntity> accounts = [];
              if (state is AccountLoaded) {
                accounts =
                    state.accounts.where((a) => a.type == accountType).toList();
              }
              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: InvoicesStrings.selectAccount,
                  border: OutlineInputBorder(),
                ),
                value: selectedAccountId,
                items: accounts
                    .map((a) =>
                        DropdownMenuItem(value: a.id, child: Text(a.name)))
                    .toList(),
                onChanged: onAccountChanged,
              );
            },
          ),
        ),
        const SizedBox(width: Dimension.spacing20),
        Expanded(
          child: BlocBuilder<AccountCubit, AccountState>(
            builder: (context, state) {
              List<AccountEntity> reps = [];
              if (state is AccountLoaded) {
                reps = state.accounts
                    .where((a) => a.type == 'representative')
                    .toList();
              }
              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: InvoicesStrings.selectRep,
                  border: OutlineInputBorder(),
                ),
                value: selectedRepId,
                items: reps
                    .map((r) =>
                        DropdownMenuItem(value: r.id, child: Text(r.name)))
                    .toList(),
                onChanged: onRepChanged,
              );
            },
          ),
        ),
      ],
    );
  }
}
