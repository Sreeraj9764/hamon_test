import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/subjects/domain/entities/subject.dart';
import 'package:hamon_test/features/subjects/domain/repositories/subject_repository.dart';

class GetSubject implements UseCase<List<Subject>, NoParams> {
  final SubjectRepository studentRepository;
  GetSubject(this.studentRepository);

  @override
  Future<Either<Failure, List<Subject>>> call(NoParams params) async {
    return await studentRepository.getSubject();
  }
}
