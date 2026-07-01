import '../repositories/accounts_repository.dart';

class DeleteAccountUseCase {
  final AccountsRepository repository;

  DeleteAccountUseCase(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteAccount(id);
  }
}
