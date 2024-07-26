part of 'classroom_bloc.dart';

@immutable
sealed class ClassRoomEvent {}

final class GetClassRoomEvent extends ClassRoomEvent {}

final class FetchClassRoomEvent extends ClassRoomEvent {
  final int id;

  FetchClassRoomEvent({required this.id});
}
