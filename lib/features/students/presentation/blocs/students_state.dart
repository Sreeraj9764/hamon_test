part of 'students_bloc.dart';

@immutable
sealed class StudentsState {}

final class StudentsBlocInitial extends StudentsState {}

final class StudentsBlocError extends StudentsState {
  final String error;

  StudentsBlocError({required this.error});
}

final class GetStudentsBlocSuccess extends StudentsState {
  final List<Student> students;

  GetStudentsBlocSuccess({required this.students});
}

final class FetchStudentsBlocSuccess extends StudentsState {
  final Student student;

  FetchStudentsBlocSuccess({required this.student});
}
