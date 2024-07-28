import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/subjects/domain/entities/subject.dart';
import 'package:hamon_test/features/subjects/domain/usecases/get_subject.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectListBloc extends Bloc<SubjectListEvent, SubjectListState> {
  final GetSubject _getSubject;
  SubjectListBloc({required GetSubject getSubject})
      : _getSubject = getSubject,
        super(SubjectListBlocInitial()) {
    on<SubjectListEvent>((event, emit) => emit(SubjectListBlocLoading()));
    on<GetSubjectListEvent>(_onGetAllSubject);
  }
  void _onGetAllSubject(
    GetSubjectListEvent event,
    Emitter<SubjectListState> emit,
  ) async {
    final res = await _getSubject(NoParams());

    res.fold(
      (l) => emit(SubjectListBlocError(error: l.message)),
      (r) => emit(SubjectListBlocSuccess(subjects: r)),
    );
  }
}
