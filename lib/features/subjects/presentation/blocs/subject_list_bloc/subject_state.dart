part of 'subject_bloc.dart';

@immutable
sealed class SubjectListState {}

final class SubjectListBlocInitial extends SubjectListState {}

final class SubjectListBlocLoading extends SubjectListState {}

final class SubjectListBlocError extends SubjectListState {
  final String error;

  SubjectListBlocError({required this.error});
}

final class SubjectListBlocSuccess extends SubjectListState {
  final List<Subject> subjects;

  SubjectListBlocSuccess({required this.subjects});
}
