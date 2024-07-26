import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/presentation/blocs/classroom_bloc.dart';

class ClassroomDetailsPage extends StatelessWidget {
  const ClassroomDetailsPage({super.key, required this.classRoomId});
  final int classRoomId;
  @override
  Widget build(BuildContext context) {
    context.read<ClassRoomBloc>().add(FetchClassRoomEvent(id: classRoomId));
    return HamonScaffold(body: BlocBuilder<ClassRoomBloc, ClassRoomState>(
      builder: (context, state) {
        if (state is ClassRoomBlocLoading || state is ClassRoomBlocInitial) {
          return const HmLoadingIndicator();
        }
        if (state is ClassRoomBlocError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is FetchClassRoomBlocSuccess) {
          return DetailContainer(
            title: state.classroom.name,
            subtitle: "Size: ${state.classroom.size.toString()}",
          );
        }
        return const Text("Retry");
      },
    ));
  }
}
