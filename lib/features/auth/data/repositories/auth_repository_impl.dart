import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_datasource.dart';
import '../models/user_model.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<UserEntity> login(String email, String password) async {
    final data = await _remoteDataSource.signIn(email, password);
    return UserModel.fromJson(data['profile'], data['email']);
  }

  @override
  Future<void> logout() async {
    await _remoteDataSource.signOut();
  }

  @override
  Future<UserEntity?> checkAuthStatus() async {
    final data = await _remoteDataSource.getCurrentUserData();
    if (data == null) return null;
    return UserModel.fromJson(data['profile'], data['email']);
  }
}
