import 'package:dio/dio.dart';
import 'package:hamon_test/core/params/app_secrets.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = AppSecrets.baseUrl
      ..options.connectTimeout = const Duration(minutes: 1)
      ..options.receiveTimeout = const Duration(minutes: 1)
      ..options.headers = {
        'Content-Type': 'application/json',
      }
      ..options.queryParameters = {"api_key": AppSecrets.apiKey};
  }

  Future<Response> get(String endPoint) async {
    try {
      final response = await _dio.get(endPoint);
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> post(String endPoint, {dynamic data}) async {
    try {
      final response = await _dio.post(endPoint, data: data);
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
