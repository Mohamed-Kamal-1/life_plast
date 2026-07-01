import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/accounts_repository.dart';
import '../datasources/accounts_local_datasource.dart';

@Singleton(as: AccountsRepository)
class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsLocalDataSource _localDataSource;

  AccountsRepositoryImpl(this._localDataSource);

  @override
  Future<List<AccountEntity>> getAccountsByType(String type) async {
    final data = await _localDataSource.getAccountsFromDb(type);
    return data
        .map((row) => AccountEntity(
              id: row.id,
              name: row.name,
              phone: row.phone,
              city: row.city,
              type: row.type,
            ))
        .toList();
  }

  @override
  Future<void> addAccount(AccountEntity account) async {
    final companion = AccountsTableCompanion(
      id: Value(account.id),
      name: Value(account.name),
      phone: Value(account.phone),
      city: Value(account.city),
      type: Value(account.type),
    );
    await _localDataSource.insertAccountToDb(companion);
  }

  @override
  Future<void> deleteAccount(String id) async {
    await _localDataSource.deleteAccountFromDb(id);
  }

  @override
  Future<List<AccountEntity>> searchAccounts(String query, String type) async {
    final data = await _localDataSource.searchAccountsInDb(query, type);
    return data
        .map((row) => AccountEntity(
              id: row.id,
              name: row.name,
              phone: row.phone,
              city: row.city,
              type: row.type,
            ))
        .toList();
  }
}
