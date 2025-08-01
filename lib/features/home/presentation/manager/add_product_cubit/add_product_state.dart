part of 'add_product_cubit.dart';

abstract class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductLoaded extends AddProductState {
  final AddProductEntity product;
  AddProductLoaded({required this.product});
}

final class AddProductError extends AddProductState {
  final String message;
  AddProductError({required this.message});
}
