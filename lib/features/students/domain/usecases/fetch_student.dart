import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/students/domain/entities/student.dart';
import 'package:hamon_test/features/students/domain/repositories/student_repository.dart';

class FetchStudent implements UseCase<Student, int> {
  final StudentRepository studentRepository;
  FetchStudent(this.studentRepository);

  @override
  Future<Either<Failure, Student>> call(int id) async {
    return await studentRepository.fetchStudent(id: id);
  }
}
