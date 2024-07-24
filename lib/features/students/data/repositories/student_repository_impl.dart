import 'package:dio/dio.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/students/data/datasources/student_remote_data_source.dart';
import 'package:hamon_test/features/students/domain/entities/student.dart';
import 'package:hamon_test/features/students/domain/repositories/student_repository.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentRemoteDataSource studentRemoteDataSource;
  final ConnectionChecker connectionChecker;

  StudentRepositoryImpl(
      {required this.studentRemoteDataSource, required this.connectionChecker});
  @override
  Future<Either<Failure, Student>> fetchStudent({required int id}) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return const Left(
            ClientFailure(message: AppConstants.noInternetConnection));
      }
      final student = await studentRemoteDataSource.fetchStudent(id: id);
      return Right(student);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Student>>> getStudents() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return const Left(
            ClientFailure(message: AppConstants.noInternetConnection));
      }
      final students = await studentRemoteDataSource.getStudents();
      return Right(students);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
