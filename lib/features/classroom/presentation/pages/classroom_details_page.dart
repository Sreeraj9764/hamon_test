import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/presentation/blocs/class_room_list/classroom_bloc.dart';

class ClassroomDetailsPage extends StatelessWidget {
  const ClassroomDetailsPage({super.key, required this.classRoomId});
  final int classRoomId;
  @override
  Widget build(BuildContext context) {
    context
        .read<ClassRoomListBloc>()
        .add(FetchClassRoomListEvent(id: classRoomId));
    return HamonScaffold(
        body: BlocBuilder<ClassRoomListBloc, ClassRoomListState>(
      builder: (context, state) {
        if (state is ClassRoomListBlocLoading ||
            state is ClassRoomListBlocInitial) {
          return const HmLoadingIndicator();
        }
        if (state is ClassRoomListBlocError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is FetchClassRoomListBlocSuccess) {
          return DetailContainer(
            title: state.classroom.name,
            subtitle: state.classroom.size.toString(),
            subtitle2: state.classroom.layout,
          );
        }
        return const Text("Retry");
      },
    ));
  }
}
