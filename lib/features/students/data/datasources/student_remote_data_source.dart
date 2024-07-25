import 'package:dio/dio.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/students/data/models/student_model.dart';

abstract interface class StudentRemoteDataSource {
  Future<List<StudentModel>> getStudents();
  Future<StudentModel> fetchStudent({required int id});
}

class StudentRemoteDataSourceImpl implements StudentRemoteDataSource {
  final Dio client = Dio(BaseOptions(
      baseUrl: AppSecrets.baseUrl,
      queryParameters: {"api_key": AppSecrets.apiKey}));

  StudentRemoteDataSourceImpl();
  @override
  Future<StudentModel> fetchStudent({required int id}) async {
    try {
      final response = await client.get("${AppSecrets.students}/$id");
      return StudentModel.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<StudentModel>> getStudents() async {
    try {
      final response = await client.get(AppSecrets.students);
      List studentList = response.data["students"];
      return studentList.map((e) => StudentModel.fromJson(e)).toList();
    } on DioException catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
