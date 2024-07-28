part of 'fetch_subject_bloc.dart';

@immutable
sealed class FetchSubjectState {}

final class FetchSubjectInitial extends FetchSubjectState {}

final class FetchSubjectBlocLoading extends FetchSubjectState {}

final class FetchSubjectBlocError extends FetchSubjectState {
  final String error;

  FetchSubjectBlocError({required this.error});
}

final class FetchSubjectBlocSuccess extends FetchSubjectState {
  final Subject subject;

  FetchSubjectBlocSuccess({required this.subject});
}
