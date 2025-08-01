part of 'delete_user_cubit.dart';

abstract class DeleteUserState {}

final class DeleteUserInitial extends DeleteUserState {}

final class DeleteUserLoading extends DeleteUserState {}

final class DeleteUserLoaded extends DeleteUserState {
  final DeleteUserEntity user;

  DeleteUserLoaded({required this.user});
}

final class DeleteUserError extends DeleteUserState {
  final String message;
  DeleteUserError({required this.message});
}
