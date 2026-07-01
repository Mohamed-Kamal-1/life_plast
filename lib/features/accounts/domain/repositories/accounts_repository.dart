import '../entities/account_entity.dart';

abstract class AccountsRepository {
  Future<List<AccountEntity>> getAccountsByType(String type);
  Future<void> addAccount(AccountEntity account);
  Future<void> deleteAccount(String id);
  Future<List<AccountEntity>> searchAccounts(String query, String type);
}
