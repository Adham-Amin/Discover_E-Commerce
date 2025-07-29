import 'package:discover/core/services/api_service.dart';
import 'package:discover/core/services/secure_storage.dart';
import 'package:discover/features/auth/data/models/login_model.dart';

abstract class RemoteAuthDataSource {
  Future<LoginModel> login({required String email, required String password});
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final ApiService apiService;

  RemoteAuthDataSourceImpl({required this.apiService});
  @override
  Future<LoginModel> login({
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
}
