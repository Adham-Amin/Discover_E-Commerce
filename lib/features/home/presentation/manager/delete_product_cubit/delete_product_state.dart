part of 'delete_product_cubit.dart';

abstract class DeleteProductState {}

final class DeleteProductInitial extends DeleteProductState {}

final class DeleteProductLoading extends DeleteProductState {}

final class DeleteProductLoaded extends DeleteProductState {
  final DeleteProductEntity product;
  DeleteProductLoaded({required this.product});
}

final class DeleteProductError extends DeleteProductState {
  final String message;
  DeleteProductError({required this.message});
}
