import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/students/domain/entities/student.dart';
import 'package:hamon_test/features/students/domain/repositories/student_repository.dart';

class GetStudents implements UseCase<List<Student>, NoParams> {
  final StudentRepository studentRepository;
  GetStudents(this.studentRepository);

  @override
  Future<Either<Failure, List<Student>>> call(NoParams params) async {
    return await studentRepository.getStudents();
  }
}
