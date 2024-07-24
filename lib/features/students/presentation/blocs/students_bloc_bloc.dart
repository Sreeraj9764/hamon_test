import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'students_bloc_event.dart';
part 'students_bloc_state.dart';

class StudentsBlocBloc extends Bloc<StudentsBlocEvent, StudentsBlocState> {
  StudentsBlocBloc() : super(StudentsBlocInitial()) {
    on<StudentsBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
