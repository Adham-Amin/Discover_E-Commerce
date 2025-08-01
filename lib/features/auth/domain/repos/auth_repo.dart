import 'package:dartz/dartz.dart';
import 'package:discover/core/error/failure.dart';
import 'package:discover/features/auth/data/models/signup_model.dart';
import 'package:discover/features/auth/domain/entities/delete_entity.dart';
import 'package:discover/features/auth/domain/entities/login_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, SignupModel>> signup({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, DeleteUserEntity>> deleteUser({required int id});
}
