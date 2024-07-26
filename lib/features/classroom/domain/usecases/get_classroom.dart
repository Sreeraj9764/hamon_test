import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/domain/entities/class_room.dart';
import 'package:hamon_test/features/classroom/domain/repositories/classroom_repository.dart';

class GetClassRoom implements UseCase<List<ClassRoom>, NoParams> {
  final ClassRoomRepository studentRepository;
  GetClassRoom(this.studentRepository);

  @override
  Future<Either<Failure, List<ClassRoom>>> call(NoParams params) async {
    return await studentRepository.getClassRoom();
  }
}
