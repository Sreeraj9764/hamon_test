import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/domain/entities/class_room.dart';
import 'package:hamon_test/features/classroom/domain/usecases/get_classroom.dart';

part 'classroom_event.dart';
part 'classroom_state.dart';

class ClassRoomListBloc extends Bloc<ClassRoomListEvent, ClassRoomListState> {
  final GetClassRoom _getClassRoom;
  ClassRoomListBloc({required GetClassRoom getClassRoom})
      : _getClassRoom = getClassRoom,
        super(ClassRoomListBlocInitial()) {
    on<ClassRoomListEvent>((event, emit) => emit(ClassRoomListBlocLoading()));
    on<GetClassRoomListEvent>(_onGetAllClassRoom);
  }
  void _onGetAllClassRoom(
    GetClassRoomListEvent event,
    Emitter<ClassRoomListState> emit,
  ) async {
    final res = await _getClassRoom(NoParams());

    res.fold(
      (l) => emit(ClassRoomListBlocError(error: l.message)),
      (r) => emit(ClassRoomListBlocSuccess(classrooms: r)),
    );
  }
}
