import 'package:discover/features/home/domain/entities/add_product_entity.dart';
import 'package:discover/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.homeRepo}) : super(AddProductInitial());
  final HomeRepo homeRepo;

  Future<void> addProduct({required String title}) async {
    emit(AddProductLoading());
    var result = await homeRepo.addProduct(title: title);
    result.fold(
      (failure) => emit(AddProductError(message: failure.message)),
      (product) => emit(AddProductLoaded(product: product)),
    );
  }
}
