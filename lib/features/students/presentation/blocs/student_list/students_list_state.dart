part of 'student_list_bloc.dart';

@immutable
sealed class StudentListState {}

final class StudentListBlocInitial extends StudentListState {}

final class StudentListBlocLoading extends StudentListState {}

final class StudentListBlocError extends StudentListState {
  final String error;

  StudentListBlocError({required this.error});
}

final class StudentListBlocSuccess extends StudentListState {
  final List<Student> students;

  StudentListBlocSuccess({required this.students});
}
