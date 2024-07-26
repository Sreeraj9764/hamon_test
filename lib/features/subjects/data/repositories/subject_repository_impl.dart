import 'package:dio/dio.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/subjects/data/datasources/subject_remote_data_source.dart';
import 'package:hamon_test/features/subjects/domain/entities/subject.dart';
import 'package:hamon_test/features/subjects/domain/repositories/subject_repository.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectRemoteDataSource subjectRemoteDataSource;
  final ConnectionChecker connectionChecker;

  SubjectRepositoryImpl(
      {required this.subjectRemoteDataSource, required this.connectionChecker});
  @override
  Future<Either<Failure, Subject>> fetchSubject({required int id}) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return const Left(
            ClientFailure(message: AppConstants.noInternetConnection));
      }
      final student = await subjectRemoteDataSource.fetchSubject(id: id);
      return Right(student);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Subject>>> getSubject() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return const Left(
            ClientFailure(message: AppConstants.noInternetConnection));
      }
      final subjects = await subjectRemoteDataSource.getSubject();
      return Right(subjects);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
