import 'package:dio/dio.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/subjects/data/models/subject_model.dart';

abstract interface class SubjectRemoteDataSource {
  Future<List<SubjectModel>> getSubject();
  Future<SubjectModel> fetchSubject({required int id});
}

class SubjectRemoteDataSourceImpl implements SubjectRemoteDataSource {
  final DioClient client;
  SubjectRemoteDataSourceImpl({required this.client});
  @override
  Future<SubjectModel> fetchSubject({required int id}) async {
    try {
      final response = await client.get("${AppSecrets.subjects}/$id");
      return SubjectModel.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<SubjectModel>> getSubject() async {
    try {
      final response = await client.get(AppSecrets.subjects);
      List classroomList = response.data["subjects"];
      return classroomList.map((e) => SubjectModel.fromJson(e)).toList();
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
