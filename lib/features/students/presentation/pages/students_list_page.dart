import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/core/widgets/hm_card.dart';
import 'package:hamon_test/features/students/presentation/blocs/student_details/student_details_bloc.dart';
import 'package:hamon_test/features/students/presentation/blocs/student_list/student_list_bloc.dart';
import 'package:hamon_test/router.dart';

class StudentsListPage extends StatefulWidget {
  const StudentsListPage({super.key});

  @override
  State<StudentsListPage> createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  @override
  void initState() {
    context.read<StudentsListBloc>().add(GetStudentsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HamonScaffold(body: BlocBuilder<StudentsListBloc, StudentListState>(
      builder: (context, state) {
        if (state is StudentListBlocLoading ||
            state is StudentListBlocInitial) {
          return const HmLoadingIndicator();
        }
        if (state is StudentListBlocError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is StudentListBlocSuccess) {
          return state.students.isNotEmpty
              ? ListView.builder(
                  itemCount: state.students.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  itemBuilder: (context, index) {
                    final currStudent = state.students[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: HmCard(
                        onTap: () {
                          context
                              .read<StudentsDetailBloc>()
                              .add(FetchStudentEvent(id: currStudent.id));
                          context.go(
                              "/${AppRouter.studentsList}/${AppRouter.studentDetails}");
                        },
                        title: currStudent.name,
                        subtitle: currStudent.email,
                        trailing: Text("Age: ${currStudent.age}"),
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
