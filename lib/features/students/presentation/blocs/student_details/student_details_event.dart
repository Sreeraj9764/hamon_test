part of 'student_details_bloc.dart';

@immutable
sealed class StudentDetailEvent {}

final class FetchStudentEvent extends StudentDetailEvent {
  final int id;

  FetchStudentEvent({required this.id});
}
