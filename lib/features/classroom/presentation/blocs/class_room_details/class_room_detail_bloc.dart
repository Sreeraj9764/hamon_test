import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/features/classroom/domain/entities/class_room.dart';
import 'package:hamon_test/features/classroom/domain/usecases/fetch_classroom.dart';

part 'class_room_detail_event.dart';
part 'class_room_detail_state.dart';

class ClassRoomDetailBloc
    extends Bloc<ClassRoomDetailEvent, ClassRoomDetailState> {
  final FetchClassRoom _fetchClassRoom;
  ClassRoomDetailBloc({required FetchClassRoom fetchClassroom})
      : _fetchClassRoom = fetchClassroom,
        super(ClassRoomDetailInitial()) {
    on<ClassRoomDetailEvent>(
        (event, emit) => emit(ClassRoomDetailBlocLoading()));
    on<FetchClassRoomLDetailEvent>(_onFetchClassRoomDetail);
  }
  void _onFetchClassRoomDetail(
    FetchClassRoomLDetailEvent event,
    Emitter<ClassRoomDetailState> emit,
  ) async {
    final res = await _fetchClassRoom(event.id);

    res.fold(
      (l) => emit(ClassRoomDetailBlocError(error: l.message)),
      (r) => emit(ClassRoomDetailBlocSuccess(classroom: r)),
    );
  }
}
