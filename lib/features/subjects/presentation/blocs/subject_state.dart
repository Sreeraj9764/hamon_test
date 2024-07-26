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
  final List<Subject> subjects;

  GetSubjectBlocSuccess({required this.subjects});
}

final class FetchSubjectBlocSuccess extends SubjectState {
  final Subject subject;

  FetchSubjectBlocSuccess({required this.subject});
}
