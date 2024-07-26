part of 'subject_bloc.dart';

@immutable
sealed class SubjectState {}

final class SubjectBlocInitial extends SubjectState {}

final class SubjectBlocLoading extends SubjectState {}

final class SubjectBlocError extends SubjectState {
  final String error;

  SubjectBlocError({required this.error});
}

final class GetSubjectBlocSuccess extends SubjectState {
  final List<Subject> classrooms;

  GetSubjectBlocSuccess({required this.classrooms});
}

final class FetchSubjectBlocSuccess extends SubjectState {
  final Subject classroom;

  FetchSubjectBlocSuccess({required this.classroom});
}
