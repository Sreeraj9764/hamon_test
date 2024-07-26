part of 'subject_bloc.dart';

@immutable
sealed class SubjectEvent {}

final class GetSubjectEvent extends SubjectEvent {}

final class FetchSubjectEvent extends SubjectEvent {
  final int id;

  FetchSubjectEvent({required this.id});
}
