import 'package:dio/dio.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/data/models/classroom_model.dart';

abstract interface class ClassRoomRemoteDataSource {
  Future<List<ClassRoomModel>> getClassRoom();
  Future<ClassRoomModel> fetchClassRoom({required int id});
}

class ClassRoomRemoteDataSourceImpl implements ClassRoomRemoteDataSource {
  final DioClient client;
  ClassRoomRemoteDataSourceImpl({required this.client});
  @override
  Future<ClassRoomModel> fetchClassRoom({required int id}) async {
    try {
      final response = await client.get("${AppSecrets.classrooms}/$id");
      return ClassRoomModel.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ClassRoomModel>> getClassRoom() async {
    try {
      final response = await client.get(AppSecrets.classrooms);
      List classroomList = response.data["classrooms"];
      return classroomList.map((e) => ClassRoomModel.fromJson(e)).toList();
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
