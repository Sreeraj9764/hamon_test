import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/subjects/domain/entities/subject.dart';

abstract interface class SubjectRepository {
  Future<Either<Failure, List<Subject>>> getSubject();
  Future<Either<Failure, Subject>> fetchSubject({required int id});
}
