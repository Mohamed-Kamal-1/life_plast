import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';

abstract class AccountsLocalDataSource {
  Future<List<AccountsTableData>> getAccountsFromDb(String type);
  Future<void> insertAccountToDb(AccountsTableCompanion account);
  Future<void> deleteAccountFromDb(String id);
  Future<List<AccountsTableData>> searchAccountsInDb(String query, String type);
}

@Singleton(as: AccountsLocalDataSource)
class AccountsLocalDataSourceImpl implements AccountsLocalDataSource {
  final AppDatabase _database;

  AccountsLocalDataSourceImpl(this._database);

  @override
  Future<List<AccountsTableData>> getAccountsFromDb(String type) async {
    return await (_database.select(_database.accountsTable)
          ..where((t) => t.type.equals(type)))
        .get();
  }

  @override
  Future<void> insertAccountToDb(AccountsTableCompanion account) async {
    await _database
        .into(_database.accountsTable)
        .insertOnConflictUpdate(account);
  }

  @override
  Future<void> deleteAccountFromDb(String id) async {
    await (_database.delete(_database.accountsTable)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Future<List<AccountsTableData>> searchAccountsInDb(
      String query, String type) async {
    return await (_database.select(_database.accountsTable)
          ..where((t) =>
              t.type.equals(type) &
              (t.name.like('%$query%') | t.phone.like('%$query%'))))
        .get();
  }
}
