import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/subjects/presentation/blocs/subject_fetch_bloc/fetch_subject_bloc.dart';

class SubjectDetailPage extends StatelessWidget {
  const SubjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HamonScaffold(
      body: BlocBuilder<FetchSubjectBloc, FetchSubjectState>(
        builder: (context, state) {
          if (state is FetchSubjectBlocLoading ||
              state is FetchSubjectInitial) {
            return const HmLoadingIndicator();
          }
          if (state is FetchSubjectBlocError) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is FetchSubjectBlocSuccess) {
            return DetailContainer(
              title: state.subject.name,
              subtitle: "Credits:  ${state.subject.credits}",
              subtitle2: state.subject.teacher,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
