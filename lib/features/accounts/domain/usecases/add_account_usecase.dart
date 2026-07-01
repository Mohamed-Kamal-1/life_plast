import '../entities/account_entity.dart';
import '../repositories/accounts_repository.dart';

class AddAccountUseCase {
  final AccountsRepository repository;

  AddAccountUseCase(this.repository);

  Future<void> call(AccountEntity account) async {
    return await repository.addAccount(account);
  }
}
