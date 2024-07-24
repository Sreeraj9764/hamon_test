import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/students/domain/entities/student.dart';

abstract interface class StudentRepository {
  Future<Either<Failure, List<Student>>> getStudents();
  Future<Either<Failure, Student>> fetchStudent({required int id});
}
