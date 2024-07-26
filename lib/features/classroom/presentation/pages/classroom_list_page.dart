import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/core/widgets/hm_card.dart';
import 'package:hamon_test/features/classroom/presentation/blocs/classroom_bloc.dart';

class ClassRoomListPage extends StatefulWidget {
  const ClassRoomListPage({super.key});

  @override
  State<ClassRoomListPage> createState() => _ClassRoomListPageState();
}

class _ClassRoomListPageState extends State<ClassRoomListPage> {
  @override
  void initState() {
    context.read<ClassRoomBloc>().add(GetClassRoomEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        if (state is GetClassRoomBlocSuccess) {
          return state.classrooms.isNotEmpty
              ? ListView.builder(
            itemCount: state.classrooms.length,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: HmCard(
                title: state.classrooms[index].name,
                subtitle: state.classrooms[index].layout,
                trailing: Text("Size: ${state.classrooms[index].size}"),
              ),
            ),
                )
              : const Center(child: Text("No Records"));
        }
        return const Text("Retry");
      },
    ));
  }
}
