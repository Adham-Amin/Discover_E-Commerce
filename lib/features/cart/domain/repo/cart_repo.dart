import 'package:dartz/dartz.dart';
import 'package:discover/core/error/failure.dart';
import 'package:discover/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, CartEntity>> getCart();
}