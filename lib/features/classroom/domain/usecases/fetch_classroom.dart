import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/domain/entities/class_room.dart';
import 'package:hamon_test/features/classroom/domain/repositories/classroom_repository.dart';

class FetchClassRoom implements UseCase<ClassRoom, int> {
  final ClassRoomRepository studentRepository;
  FetchClassRoom(this.studentRepository);

  @override
  Future<Either<Failure, ClassRoom>> call(int id) async {
    return await studentRepository.fetchClassRoom(id: id);
  }
}
