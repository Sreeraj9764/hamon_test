import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/registration/domain/entities/register.dart';

abstract interface class RegistrationRepository {
  Future<Either<Failure, List<Registration>>> getRegistration();
  Future<Either<Failure, Registration>> fetchRegistration({required int id});
  Future<Either<Failure, Registration>> register(
      {required Registration registration});
}
