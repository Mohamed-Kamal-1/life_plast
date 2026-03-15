import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../all_data_service/data/models/account/all_accounts.dart';
import 'Accounts_State.dart';

@injectable
class AccountsCubit extends Cubit<AccountsState> {
  final AccountService _service;

  AccountsCubit(this._service) : super(AccountsInitial());

  // 1. جلب البيانات لكل الأنواع (الموحدة)
  void loadAccounts(String type) {
    emit(AccountsLoading());
    List<AccountModel> data = _getFilteredList(type);
    emit(AccountsLoaded(List.from(data))); // List.from لضمان تحديث الـ UI
  }

  // 2. البحث الموحد لكل الأنواع
  void searchAccounts(String query, String type) {
    final all = _getFilteredList(type);
    final filtered = all
        .where((a) => a.name.contains(query) || a.phone.contains(query))
        .toList();
    emit(AccountsLoaded(filtered));
  }

  // 3. إضافة حساب جديد وتحديث فوري
  void addNewAccount(AccountModel account) {
    _service.addAccount(account);
    loadAccounts(account.type); // تحديث القائمة فوراً بناءً على النوع
  }

  // 4. حذف حساب وتحديث فوري (نفس نظام المخزن)
  void deleteAccount(String id, String type) {
    _service.deleteAccount(id, type); // حذف من السيرفس والذاكرة
    loadAccounts(type); // إعادة تحميل القائمة ليمسح الصف من الشاشة فوراً
  }

  // دالة مساعدة خاصة بالكيوبيت لجلب اللستة الصح بناءً على النوع
  List<AccountModel> _getFilteredList(String type) {
    switch (type) {
      case 'customer':
        return _service.customers;
      case 'supplier':
        return _service.suppliers;
      case 'employee':
        return _service.employees;
      case 'representative':
        return _service.reps;
      default:
        return [];
    }
  }

  void resetAllData(String id, String type) async {
    _service.deleteAccount(id, type);
    loadAccounts(type);
  }
}
