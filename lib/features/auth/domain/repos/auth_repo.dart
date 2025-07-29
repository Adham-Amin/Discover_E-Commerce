import 'package:dartz/dartz.dart';
import 'package:discover/core/error/failure.dart';
import 'package:discover/features/auth/data/models/login_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login({required String email, required String password});
  
}