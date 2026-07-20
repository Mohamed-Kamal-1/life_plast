import 'package:injectable/injectable.dart';

import '../../../../core/error/api_result.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_datasource.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSourceImpl remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<UserEntity>> login(
      {required String email, required String password}) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Result.success(userModel);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(message: e.message));
    } catch (e) {
      return Result.failure(
          ServerFailure(message: 'حدث خطأ غير متوقع أثناء تسجيل الدخول'));
    }
  }

  @override
  Future<void> logout() async {
    // سيتم تنفيذها لاحقاً مع Supabase
  }
}
