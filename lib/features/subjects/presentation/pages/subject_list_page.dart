import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/subjects/presentation/blocs/subject_fetch_bloc/fetch_subject_bloc.dart';
import 'package:hamon_test/features/subjects/presentation/blocs/subject_list_bloc/subject_bloc.dart';
import 'package:hamon_test/router.dart';

class SubjectListPage extends StatefulWidget {
  const SubjectListPage({super.key});

  @override
  State<SubjectListPage> createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {
  @override
  void initState() {
    context.read<SubjectListBloc>().add(GetSubjectListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HamonScaffold(body: BlocBuilder<SubjectListBloc, SubjectListState>(
      builder: (context, state) {
        if (state is SubjectListBlocLoading ||
            state is SubjectListBlocInitial) {
          return const HmLoadingIndicator();
        }
        if (state is SubjectListBlocError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is SubjectListBlocSuccess) {
          return state.subjects.isNotEmpty
              ? ListView.builder(
                  itemCount: state.subjects.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  itemBuilder: (context, index) {
                    final currSubject = state.subjects[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: HmCard(
                        title: currSubject.name,
                        subtitle: currSubject.teacher,
                        trailing: Text("Credits: ${currSubject.credits}"),
                        onTap: () {
                          context
                              .read<FetchSubjectBloc>()
                              .add(FetchSubjectEvent(id: currSubject.id));
                          context.go(
                              "/${AppRouter.subjectList}/${AppRouter.subjectDetail}");
                        },
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
