import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:discover/core/error/failure.dart';
import 'package:discover/features/home/data/data_sources/remote_home_data_source.dart';
import 'package:discover/features/home/domain/entities/product_entity.dart';
import 'package:discover/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final RemoteHomeDataSource remoteHomeDataSource;
  HomeRepoImpl({required this.remoteHomeDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductCategory({
    required String category,
  }) async {
    try {
      var data = await remoteHomeDataSource.getProductCategory(
        category: category,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await remoteHomeDataSource.getProducts();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> search({
    required String q,
  }) async {
    try {
      var data = await remoteHomeDataSource.search(q: q);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
