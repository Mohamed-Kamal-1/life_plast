import '../../../../all_data_service/data/models/account/all_accounts.dart';

abstract class AccountsState {}

class AccountsInitial extends AccountsState {}

class AccountsLoading extends AccountsState {}

class AccountsLoaded extends AccountsState {
  final List<AccountModel> accounts; // القائمة المفلترة اللي هتظهر في الجدول
  AccountsLoaded(this.accounts);
}

class AccountsError extends AccountsState {
  final String message;
  AccountsError(this.message);
}