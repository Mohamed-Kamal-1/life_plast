import 'package:injectable/injectable.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class CheckAuthUseCase {
  final AuthRepository repository;

  CheckAuthUseCase(this.repository);

  Future<UserEntity?> call() async {
    return await repository.checkAuthStatus();
  }
}
