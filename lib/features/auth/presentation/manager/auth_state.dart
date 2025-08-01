abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final String? name;
  AuthLoaded({this.name});
}

final class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}
