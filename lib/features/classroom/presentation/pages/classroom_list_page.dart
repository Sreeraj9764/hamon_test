import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/classroom/presentation/blocs/class_room_list/classroom_bloc.dart';

class ClassRoomListPage extends StatefulWidget {
  const ClassRoomListPage({super.key});

  @override
  State<ClassRoomListPage> createState() => _ClassRoomListPageState();
}

class _ClassRoomListPageState extends State<ClassRoomListPage> {
  @override
  void initState() {
    context.read<ClassRoomListBloc>().add(GetClassRoomListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        if (state is GetClassRoomListBlocSuccess) {
          return state.classrooms.isNotEmpty
              ? ListView.builder(
                  itemCount: state.classrooms.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  itemBuilder: (context, index) {
                    final classRoomState = state.classrooms[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: HmCard(
                        title: classRoomState.name,
                        subtitle: classRoomState.layout,
                        trailing: Text("Size: ${state.classrooms[index].size}"),
                      ),
                    );
                  })
              : const Center(child: Text("No Records"));
        }
        return const Text("Retry");
      },
    ));
  }
}
