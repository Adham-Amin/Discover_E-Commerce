import 'package:dartz/dartz.dart';
import 'package:discover/core/error/failure.dart';
import 'package:discover/features/home/domain/entities/add_cart_entity.dart';
import 'package:discover/features/home/domain/entities/add_product_entity.dart';
import 'package:discover/features/home/domain/entities/delete_product_entity.dart';
import 'package:discover/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getProductCategory({
    required String category,
  });
  Future<Either<Failure, List<ProductEntity>>> search({required String q});
  Future<Either<Failure, AddProductEntity>> addProduct({required String title});
  Future<Either<Failure, DeleteProductEntity>> deleteProduct({required int id});
  Future<Either<Failure, AddCartEntity>> addToCart({
    required int id,
    required int quantity,
  });
}
