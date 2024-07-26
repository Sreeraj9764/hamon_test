import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/subjects/domain/entities/subject.dart';
import 'package:hamon_test/features/subjects/domain/usecases/fetch_subject.dart';
import 'package:hamon_test/features/subjects/domain/usecases/get_subject.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final FetchSubject _fetchSubject;
  final GetSubject _getSubject;
  SubjectBloc(
      {required FetchSubject fetchSubject, required GetSubject getSubject})
      : _fetchSubject = fetchSubject,
        _getSubject = getSubject,
        super(SubjectBlocInitial()) {
    on<SubjectEvent>((event, emit) => emit(SubjectBlocLoading()));
    on<GetSubjectEvent>(_onGetAllSubject);
    on<FetchSubjectEvent>(_onFetchSubject);
  }
  void _onGetAllSubject(
    GetSubjectEvent event,
    Emitter<SubjectState> emit,
  ) async {
    final res = await _getSubject(NoParams());

    res.fold(
      (l) => emit(SubjectBlocError(error: l.message)),
      (r) => emit(GetSubjectBlocSuccess(classrooms: r)),
    );
  }

  void _onFetchSubject(
    FetchSubjectEvent event,
    Emitter<SubjectState> emit,
  ) async {
    final res = await _fetchSubject(event.id);

    res.fold(
      (l) => emit(SubjectBlocError(error: l.message)),
      (r) => emit(FetchSubjectBlocSuccess(classroom: r)),
    );
  }
}
