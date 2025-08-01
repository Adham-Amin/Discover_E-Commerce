import 'package:discover/features/home/domain/entities/add_cart_entity.dart';
import 'package:discover/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit({required this.homeRepo}) : super(AddToCartInitial());

  final HomeRepo homeRepo;

  Future<void> addToCart({required int id, required int quantity}) async {
    emit(AddToCartLoading());
    var result = await homeRepo.addToCart(id: id, quantity: quantity);
    result.fold(
      (failure) => emit(AddToCartError(message: failure.message)),
      (product) => emit(AddToCartLoaded(product: product)),
    );
  }
}
