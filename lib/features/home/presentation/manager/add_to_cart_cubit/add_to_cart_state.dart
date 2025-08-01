part of 'add_to_cart_cubit.dart';

abstract class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartLoaded extends AddToCartState {
  final AddCartEntity product;
  AddToCartLoaded({required this.product});
}

final class AddToCartError extends AddToCartState {
  final String message;
  AddToCartError({required this.message});
}
