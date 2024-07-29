part of 'class_room_detail_bloc.dart';

@immutable
sealed class ClassRoomDetailEvent {}

final class FetchClassRoomLDetailEvent extends ClassRoomDetailEvent {
  final int id;

  FetchClassRoomLDetailEvent({required this.id});
}
