part of 'student_list_bloc.dart';

@immutable
sealed class StudentsListEvent {}

final class GetStudentsEvent extends StudentsListEvent {}
