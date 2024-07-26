import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/core/widgets/hm_card.dart';
import 'package:hamon_test/features/students/presentation/blocs/students_bloc.dart';

class StudentsListPage extends StatefulWidget {
  const StudentsListPage({super.key});

  @override
  State<StudentsListPage> createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  @override
  void initState() {
    context.read<StudentsBloc>().add(GetStudentsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HamonScaffold(body: BlocBuilder<StudentsBloc, StudentsState>(
      builder: (context, state) {
        if (state is StudentsBlocLoading || state is StudentsBlocInitial) {
          return const HmLoadingIndicator();
        }
        if (state is StudentsBlocError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is GetStudentsBlocSuccess) {
          return state.students.isNotEmpty
              ? ListView.builder(
            itemCount: state.students.length,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemBuilder: (context, index) =>
                Padding(
              padding: const EdgeInsets.only(top: 10),
              child: HmCard(
                title: state.students[index].name,
                subtitle: state.students[index].email,
                trailing: Text("Age: ${state.students[index].age}"),
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
