import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://dummyjson.com';

  ApiService(this._dio);

  Future<dynamic> get({required String endPoint}) async {
    final Response response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final Response response = await _dio.post('$baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    final Response response = await _dio.delete('$baseUrl$endPoint');
    return response.data;
  }
}
