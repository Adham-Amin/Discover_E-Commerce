import 'package:discover/features/auth/domain/repos/auth_repo.dart';
import 'package:discover/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    var result = await authRepo.login(email: email, password: password);
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthLoaded(name: user.name)),
    );
  }

  Future<void> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.signup(
      username: username,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => emit(AuthLoaded()),
    );
  }
}
