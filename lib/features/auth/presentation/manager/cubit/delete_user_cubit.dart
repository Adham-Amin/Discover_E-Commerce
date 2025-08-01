import 'package:discover/features/auth/domain/entities/delete_entity.dart';
import 'package:discover/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit({required this.authRepo}) : super(DeleteUserInitial());

  final AuthRepo authRepo;

  Future<void> deleteUser({required int id}) async {
    emit(DeleteUserLoading());
    var result = await authRepo.deleteUser(id: id);
    result.fold(
      (failure) => emit(DeleteUserError(message: failure.message)),
      (user) => emit(DeleteUserLoaded(user: user)),
    );
  }
}
