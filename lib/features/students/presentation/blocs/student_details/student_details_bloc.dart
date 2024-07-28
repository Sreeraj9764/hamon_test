import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/features/students/domain/entities/student.dart';
import 'package:hamon_test/features/students/domain/usecases/fetch_student.dart';

part 'student_details_event.dart';
part 'student_details_state.dart';

class StudentsDetailBloc extends Bloc<StudentDetailEvent, StudentDetailState> {
  final FetchStudent _fetchStudent;
  StudentsDetailBloc({required FetchStudent fetchStudent})
      : _fetchStudent = fetchStudent,
        super(StudentDetailBlocInitial()) {
    on<StudentDetailEvent>((event, emit) => emit(StudentDetailBlocLoading()));
    on<FetchStudentEvent>(_onFetchStudent);
  }
  void _onFetchStudent(
    FetchStudentEvent event,
    Emitter<StudentDetailState> emit,
  ) async {
    final res = await _fetchStudent(event.id);

    res.fold(
      (l) => emit(StudentDetailBlocError(error: l.message)),
      (r) => emit(StudentDetailBlocSuccess(student: r)),
    );
  }
}
