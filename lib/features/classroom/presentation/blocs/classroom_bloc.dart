import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/domain/entities/class_room.dart';
import 'package:hamon_test/features/classroom/domain/usecases/fetch_classroom.dart';
import 'package:hamon_test/features/classroom/domain/usecases/get_classroom.dart';

part 'classroom_event.dart';
part 'classroom_state.dart';

class ClassRoomBloc extends Bloc<ClassRoomEvent, ClassRoomState> {
  final FetchClassRoom _fetchClassRoom;
  final GetClassRoom _getClassRoom;
  ClassRoomBloc(
      {required FetchClassRoom fetchClassRoom,
      required GetClassRoom getClassRoom})
      : _fetchClassRoom = fetchClassRoom,
        _getClassRoom = getClassRoom,
        super(ClassRoomBlocInitial()) {
    on<ClassRoomEvent>((event, emit) => emit(ClassRoomBlocLoading()));
    on<GetClassRoomEvent>(_onGetAllClassRoom);
    on<FetchClassRoomEvent>(_onFetchClassRoom);
  }
  void _onGetAllClassRoom(
    GetClassRoomEvent event,
    Emitter<ClassRoomState> emit,
  ) async {
    final res = await _getClassRoom(NoParams());

    res.fold(
      (l) => emit(ClassRoomBlocError(error: l.message)),
      (r) => emit(GetClassRoomBlocSuccess(classrooms: r)),
    );
  }

  void _onFetchClassRoom(
    FetchClassRoomEvent event,
    Emitter<ClassRoomState> emit,
  ) async {
    final res = await _fetchClassRoom(event.id);

    res.fold(
      (l) => emit(ClassRoomBlocError(error: l.message)),
      (r) => emit(FetchClassRoomBlocSuccess(classroom: r)),
    );
  }
}
