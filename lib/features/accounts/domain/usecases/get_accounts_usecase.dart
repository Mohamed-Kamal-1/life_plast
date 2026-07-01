import '../entities/account_entity.dart';
import '../repositories/accounts_repository.dart';

class GetAccountsUseCase {
  final AccountsRepository repository;

  GetAccountsUseCase(this.repository);

  Future<List<AccountEntity>> call(String type) async {
    return await repository.getAccountsByType(type);
  }
}
