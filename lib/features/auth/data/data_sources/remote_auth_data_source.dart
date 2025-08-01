import 'package:discover/core/services/api_service.dart';
import 'package:discover/core/services/secure_storage.dart';
import 'package:discover/features/auth/data/models/delete_user_model/delete_user_model.dart';
import 'package:discover/features/auth/data/models/login_model.dart';
import 'package:discover/features/auth/data/models/signup_model.dart';
import 'package:discover/features/auth/domain/entities/delete_entity.dart';
import 'package:discover/features/auth/domain/entities/login_entity.dart';

abstract class RemoteAuthDataSource {
  Future<LoginEntity> login({required String email, required String password});
  Future<SignupModel> signup({
    required String username,
    required String email,
    required String password,
  });
  Future<DeleteUserEntity> deleteUser({required int id});
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final ApiService apiService;

  RemoteAuthDataSourceImpl({required this.apiService});
  @override
  Future<LoginEntity> login({
    required String email,
    required String password,
  }) async {
    final response = await apiService.post(
      endPoint: '/auth/login',
      data: {'username': email, 'password': password},
    );

    var token = LoginModel.fromJson(response);
    await SecureStorage.write(key: 'token', value: token.token);

    return token;
  }

  @override
  Future<DeleteUserEntity> deleteUser({required int id}) async {
    var data = await apiService.delete(endPoint: '/users/$id');

    var user = DeleteUserModel.fromJson(data);
    return user;
  }

  @override
  Future<SignupModel> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    var data = await apiService.post(
      endPoint: '/users',
      data: {
        'username': username,
        'email': email,
        'password': password,
        'id': 1,
      },
    );

    var user = SignupModel.fromJson(data);
    return user;
  }
}
