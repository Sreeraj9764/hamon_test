part of 'fetch_subject_bloc.dart';

@immutable
sealed class SubjectDetailEvent {}

final class FetchSubjectEvent extends SubjectDetailEvent {
  final int id;

  FetchSubjectEvent({required this.id});
}
