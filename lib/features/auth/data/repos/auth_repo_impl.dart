import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:discover/core/error/failure.dart';
import 'package:discover/features/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:discover/features/auth/data/models/login_model.dart';
import 'package:discover/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final RemoteAuthDataSource remoteAuthDataSource;

  AuthRepoImpl({required this.remoteAuthDataSource});
  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var data = await remoteAuthDataSource.login(
        email: email,
        password: password,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
