part of 'class_room_detail_bloc.dart';

@immutable
sealed class ClassRoomDetailState {}

final class ClassRoomDetailInitial extends ClassRoomDetailState {}

final class ClassRoomDetailBlocLoading extends ClassRoomDetailState {}

final class ClassRoomDetailBlocError extends ClassRoomDetailState {
  final String error;

  ClassRoomDetailBlocError({required this.error});
}

final class ClassRoomDetailBlocSuccess extends ClassRoomDetailState {
  final ClassRoom classroom;

  ClassRoomDetailBlocSuccess({required this.classroom});
}
