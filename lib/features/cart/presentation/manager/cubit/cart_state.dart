part of 'cart_cubit.dart';

abstract class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartLoaded extends CartState {
  final CartEntity cart;
  CartLoaded({required this.cart});
}
final class CartError extends CartState {
  final String message;
  CartError({required this.message});
}
