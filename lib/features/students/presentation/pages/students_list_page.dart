import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    return Scaffold();
  }
}
