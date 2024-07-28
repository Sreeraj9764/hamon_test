import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/features/students/presentation/blocs/student_details/student_details_bloc.dart';

class StudentDetailPage extends StatelessWidget {
  const StudentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HamonScaffold(
      body: BlocBuilder<StudentsDetailBloc, StudentDetailState>(
        builder: (context, state) {
          if (state is StudentDetailBlocLoading ||
              state is StudentDetailBlocInitial) {
            return const HmLoadingIndicator();
          }
          if (state is StudentDetailBlocError) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is StudentDetailBlocSuccess) {
            return DetailContainer(
              title: state.student.name,
              subtitle: state.student.age.toString(),
              subtitle2: state.student.email,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
