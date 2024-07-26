import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/domain/entities/class_room.dart';

abstract interface class ClassRoomRepository {
  Future<Either<Failure, List<ClassRoom>>> getClassRoom();
  Future<Either<Failure, ClassRoom>> fetchClassRoom({required int id});
}
