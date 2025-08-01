import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:discover/core/error/failure.dart';
import 'package:discover/features/cart/data/data_source/remote_cart_data_source.dart';
import 'package:discover/features/cart/domain/entities/cart_entity.dart';
import 'package:discover/features/cart/domain/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final RemoteCartDataSource remoteCartDataSource;

  CartRepoImpl({required this.remoteCartDataSource});
  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      var result = await remoteCartDataSource.getCart();
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
