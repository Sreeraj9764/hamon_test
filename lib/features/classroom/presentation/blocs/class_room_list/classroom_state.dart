part of 'classroom_bloc.dart';

@immutable
sealed class ClassRoomListState {}

final class ClassRoomListBlocInitial extends ClassRoomListState {}

final class ClassRoomListBlocLoading extends ClassRoomListState {}

final class ClassRoomListBlocError extends ClassRoomListState {
  final String error;

  ClassRoomListBlocError({required this.error});
}

final class ClassRoomListBlocSuccess extends ClassRoomListState {
  final List<ClassRoom> classrooms;

  ClassRoomListBlocSuccess({required this.classrooms});
}
