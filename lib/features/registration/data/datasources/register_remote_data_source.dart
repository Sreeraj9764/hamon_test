import 'package:dio/dio.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/registration/data/models/register_model.dart';

abstract interface class RegistrationRemoteDataSource {
  Future<List<RegistrationModel>> getRegistration();
  Future<RegistrationModel> fetchRegistration({required int id});
}

class RegistrationRemoteDataSourceImpl implements RegistrationRemoteDataSource {
  final DioClient client;
  RegistrationRemoteDataSourceImpl({required this.client});
  @override
  Future<RegistrationModel> fetchRegistration({required int id}) async {
    try {
      final response = await client.get("${AppSecrets.registration}/$id");
      return RegistrationModel.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<RegistrationModel>> getRegistration() async {
    try {
      final response = await client.get(AppSecrets.registration);
      List registrationList = response.data["registrations"];
      return registrationList
          .map((e) => RegistrationModel.fromJson(e))
          .toList();
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
