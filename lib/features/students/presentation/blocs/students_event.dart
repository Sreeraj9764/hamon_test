part of 'students_bloc.dart';

@immutable
sealed class StudentsEvent {}

final class GetStudents extends StudentsEvent {}

final class FetchStudent extends StudentsEvent {
  final int id;

  FetchStudent({required this.id});
}
