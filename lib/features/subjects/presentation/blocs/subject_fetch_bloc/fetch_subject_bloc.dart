import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/features/subjects/domain/entities/subject.dart';
import 'package:hamon_test/features/subjects/domain/usecases/fetch_subject.dart';

part 'fetch_subject_event.dart';
part 'fetch_subject_state.dart';

class FetchSubjectBloc extends Bloc<SubjectDetailEvent, FetchSubjectState> {
  final FetchSubject _fetchSubject;
  FetchSubjectBloc({required FetchSubject fetchSubject})
      : _fetchSubject = fetchSubject,
        super(FetchSubjectInitial()) {
    on<SubjectDetailEvent>((event, emit) => emit(FetchSubjectBlocLoading()));
    on<FetchSubjectEvent>(_onFetchSubject);
  }

  void _onFetchSubject(
    FetchSubjectEvent event,
    Emitter<FetchSubjectState> emit,
  ) async {
    final res = await _fetchSubject(event.id);

    res.fold(
      (l) => emit(FetchSubjectBlocError(error: l.message)),
      (r) => emit(FetchSubjectBlocSuccess(subject: r)),
    );
  }
}
