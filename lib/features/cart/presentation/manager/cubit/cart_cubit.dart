import 'package:discover/features/cart/domain/entities/cart_entity.dart';
import 'package:discover/features/cart/domain/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo}) : super(CartInitial());

  final CartRepo cartRepo;
  Future<void> getCart() async {
    emit(CartLoading());
    final result = await cartRepo.getCart();
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (cart) => emit(CartLoaded(cart: cart)),
    );
  }
}
