part of 'students_bloc.dart';

@immutable
sealed class StudentsEvent {}

final class GetStudentsEvent extends StudentsEvent {}

final class FetchStudentEvent extends StudentsEvent {
  final int id;

  FetchStudentEvent({required this.id});
}
