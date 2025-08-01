import 'package:discover/features/home/domain/entities/delete_product_entity.dart';
import 'package:discover/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit({required this.homeRepo}) : super(DeleteProductInitial());

  final HomeRepo homeRepo;

  Future<void> deleteProduct({required int id}) async {
    emit(DeleteProductLoading());
    var result = await homeRepo.deleteProduct(id: id);
    result.fold(
      (failure) => emit(DeleteProductError(message: failure.message)),
      (product) => emit(DeleteProductLoaded(product: product)),
    );
  }
}
