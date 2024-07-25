import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/students/domain/entities/student.dart';
import 'package:hamon_test/features/students/domain/usecases/fetch_student.dart';
import 'package:hamon_test/features/students/domain/usecases/get_students.dart';

part 'students_event.dart';
part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  final FetchStudent _fetchStudent;
  final GetStudents _getStudents;
  StudentsBloc(
      {required FetchStudent fetchStudent, required GetStudents getStudents})
      : _fetchStudent = fetchStudent,
        _getStudents = getStudents,
        super(StudentsBlocInitial()) {
    //on<StudentsEvent>((event, emit) => emit(StudentsBlocLoading()));
    on<GetStudentsEvent>(_onGetAllStudents);
    on<FetchStudentEvent>(_onFetchStudent);
  }
  void _onGetAllStudents(
    GetStudentsEvent event,
    Emitter<StudentsState> emit,
  ) async {
    final res = await _getStudents(NoParams());

    res.fold(
      (l) => emit(StudentsBlocError(error: l.message)),
      (r) => emit(GetStudentsBlocSuccess(students: r)),
    );
  }

  void _onFetchStudent(
    FetchStudentEvent event,
    Emitter<StudentsState> emit,
  ) async {
    final res = await _fetchStudent(event.id);

    res.fold(
      (l) => emit(StudentsBlocError(error: l.message)),
      (r) => emit(FetchStudentsBlocSuccess(student: r)),
    );
  }
}
