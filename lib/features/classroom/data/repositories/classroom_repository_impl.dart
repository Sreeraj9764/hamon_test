import 'package:dio/dio.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/data/datasources/classroom_remote_data_source.dart';
import 'package:hamon_test/features/classroom/domain/entities/class_room.dart';
import 'package:hamon_test/features/classroom/domain/repositories/classroom_repository.dart';

class ClassRoomRepositoryImpl implements ClassRoomRepository {
  final ClassRoomRemoteDataSource classroomRemoteDataSource;
  final ConnectionChecker connectionChecker;

  ClassRoomRepositoryImpl(
      {required this.classroomRemoteDataSource,
      required this.connectionChecker});
  @override
  Future<Either<Failure, ClassRoom>> fetchClassRoom({required int id}) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return const Left(
            ClientFailure(message: AppConstants.noInternetConnection));
      }
      final student = await classroomRemoteDataSource.fetchClassRoom(id: id);
      return Right(student);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ClassRoom>>> getClassRoom() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return const Left(
            ClientFailure(message: AppConstants.noInternetConnection));
      }
      final ClassRoom = await classroomRemoteDataSource.getClassRoom();
      return Right(ClassRoom);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
