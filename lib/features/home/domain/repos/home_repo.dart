import 'package:dartz/dartz.dart';
import 'package:discover/core/error/failure.dart';
import 'package:discover/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getProductCategory({
    required String category,
  });
  Future<Either<Failure, List<ProductEntity>>> search({required String q});
}
