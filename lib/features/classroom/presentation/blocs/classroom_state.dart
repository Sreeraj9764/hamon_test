part of 'classroom_bloc.dart';

@immutable
sealed class ClassRoomState {}

final class ClassRoomBlocInitial extends ClassRoomState {}

final class ClassRoomBlocLoading extends ClassRoomState {}

final class ClassRoomBlocError extends ClassRoomState {
  final String error;

  ClassRoomBlocError({required this.error});
}

final class GetClassRoomBlocSuccess extends ClassRoomState {
  final List<ClassRoom> classrooms;

  GetClassRoomBlocSuccess({required this.classrooms});
}

final class FetchClassRoomBlocSuccess extends ClassRoomState {
  final ClassRoom classroom;

  FetchClassRoomBlocSuccess({required this.classroom});
}
