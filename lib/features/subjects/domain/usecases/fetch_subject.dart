import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/subjects/domain/entities/subject.dart';
import 'package:hamon_test/features/subjects/domain/repositories/subject_repository.dart';

class FetchSubject implements UseCase<Subject, int> {
  final SubjectRepository studentRepository;
  FetchSubject(this.studentRepository);

  @override
  Future<Either<Failure, Subject>> call(int id) async {
    return await studentRepository.fetchSubject(id: id);
  }
}
