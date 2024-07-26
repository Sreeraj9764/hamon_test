import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/core/widgets/hm_card.dart';
import 'package:hamon_test/features/subjects/presentation/blocs/subject_bloc.dart';

class SubjectListPage extends StatefulWidget {
  const SubjectListPage({super.key});

  @override
  State<SubjectListPage> createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {
  @override
  void initState() {
    context.read<SubjectBloc>().add(GetSubjectEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HamonScaffold(body: BlocBuilder<SubjectBloc, SubjectState>(
      builder: (context, state) {
        if (state is SubjectBlocLoading || state is SubjectBlocInitial) {
          return const HmLoadingIndicator();
        }
        if (state is SubjectBlocError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is GetSubjectBlocSuccess) {
          return ListView.builder(
            itemCount: state.classrooms.length,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: HmCard(
                title: state.classrooms[index].name,
                subtitle: state.classrooms[index].teacher,
                trailing: Text("Credits: ${state.classrooms[index].credits}"),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    ));
  }
}
