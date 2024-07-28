part of 'student_details_bloc.dart';

@immutable
sealed class StudentDetailState {}

final class StudentDetailBlocInitial extends StudentDetailState {}

final class StudentDetailBlocLoading extends StudentDetailState {}

final class StudentDetailBlocError extends StudentDetailState {
  final String error;

  StudentDetailBlocError({required this.error});
}

final class StudentDetailBlocSuccess extends StudentDetailState {
  final Student student;

  StudentDetailBlocSuccess({required this.student});
}
