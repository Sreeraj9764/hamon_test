import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/presentation/blocs/class_room_details/class_room_detail_bloc.dart';

class ClassroomDetailsPage extends StatelessWidget {
  const ClassroomDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return HamonScaffold(
        body: BlocBuilder<ClassRoomDetailBloc, ClassRoomDetailState>(
      builder: (context, state) {
        if (state is ClassRoomDetailBlocLoading ||
            state is ClassRoomDetailInitial) {
          return const HmLoadingIndicator();
        }
        if (state is ClassRoomDetailBlocError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is ClassRoomDetailBlocSuccess) {
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
