import 'package:dio/dio.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/registration/data/datasources/register_remote_data_source.dart';
import 'package:hamon_test/features/registration/domain/entities/register.dart';
import 'package:hamon_test/features/registration/domain/repositories/register_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationRemoteDataSource registerRemoteDataSource;
  final ConnectionChecker connectionChecker;

  RegistrationRepositoryImpl(
      {required this.registerRemoteDataSource,
      required this.connectionChecker});
  @override
  Future<Either<Failure, Registration>> fetchRegistration(
      {required int id}) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return const Left(
            ClientFailure(message: AppConstants.noInternetConnection));
      }
      final student = await registerRemoteDataSource.fetchRegistration(id: id);
      return Right(student);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Registration>>> getRegistration() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return const Left(
            ClientFailure(message: AppConstants.noInternetConnection));
      }
      final subjects = await registerRemoteDataSource.getRegistration();
      return Right(subjects);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
