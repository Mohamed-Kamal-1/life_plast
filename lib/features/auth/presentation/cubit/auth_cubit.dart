import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/login_usecase.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;

  AuthCubit(this._loginUseCase) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    // لم نقم بعمل ترقيع الإيميل هنا، يجب إدخال إيميل صحيح
    final result =
        await _loginUseCase(LoginParams(email: email, password: password));

    result.fold(
      onFailure: (failure) => emit(AuthError(failure.message)),
      onSuccess: (user) => emit(AuthSuccess(user)),
    );
  }
}
