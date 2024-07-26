import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/registration/domain/entities/register.dart';
import 'package:hamon_test/features/registration/domain/repositories/register_repository.dart';

class GetRegistration implements UseCase<List<Registration>, NoParams> {
  final RegistrationRepository studentRepository;
  GetRegistration(this.studentRepository);

  @override
  Future<Either<Failure, List<Registration>>> call(NoParams params) async {
    return await studentRepository.getRegistration();
  }
}
