import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/registration/domain/entities/register.dart';
import 'package:hamon_test/features/registration/domain/repositories/register_repository.dart';

class FetchRegistration implements UseCase<Registration, int> {
  final RegistrationRepository studentRepository;
  FetchRegistration(this.studentRepository);

  @override
  Future<Either<Failure, Registration>> call(int id) async {
    return await studentRepository.fetchRegistration(id: id);
  }
}
