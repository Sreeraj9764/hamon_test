import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/students/domain/entities/student.dart';
import 'package:hamon_test/features/students/domain/usecases/get_students.dart';

part 'student_list_event.dart';
part 'students_list_state.dart';

class StudentsListBloc extends Bloc<StudentsListEvent, StudentListState> {
  final GetStudents _getStudents;
  StudentsListBloc({required GetStudents getStudents})
      : _getStudents = getStudents,
        super(StudentListBlocInitial()) {
    on<StudentsListEvent>((event, emit) => emit(StudentListBlocLoading()));
    on<GetStudentsEvent>(_onGetAllStudents);
  }
  void _onGetAllStudents(
    GetStudentsEvent event,
    Emitter<StudentListState> emit,
  ) async {
    final res = await _getStudents(NoParams());

    res.fold(
      (l) => emit(StudentListBlocError(error: l.message)),
      (r) => emit(StudentListBlocSuccess(students: r)),
    );
  }
}
