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
          return const CircularProgressIndicator();
        }
        if (state is StudentsBlocError) return const Text("Error");
        if (state is GetStudentsBlocSuccess) {
          return ListView.builder(
            itemCount: state.students.length,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemBuilder: (context, index) =>
                HmCard(child: Text(state.students[index].name)),
          );
        }
        ;
        return const SizedBox();
      },
    ));
  }
}
