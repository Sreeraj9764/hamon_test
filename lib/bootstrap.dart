import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/features/classroom/presentation/blocs/class_room_details/class_room_detail_bloc.dart';
import 'package:hamon_test/features/classroom/presentation/blocs/class_room_list/classroom_bloc.dart';
import 'package:hamon_test/features/registration/presentation/blocs/register_bloc.dart';
import 'package:hamon_test/features/students/presentation/blocs/student_details/student_details_bloc.dart';
import 'package:hamon_test/features/subjects/presentation/blocs/subject_fetch_bloc/fetch_subject_bloc.dart';
import 'package:hamon_test/features/subjects/presentation/blocs/subject_list_bloc/subject_bloc.dart';

import 'core/app_core.dart';
import 'features/students/presentation/blocs/student_list/student_list_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => sl<StudentsListBloc>(),
    ),
    BlocProvider(
      create: (_) => sl<StudentsDetailBloc>(),
    ),
    BlocProvider(
      create: (_) => sl<ClassRoomListBloc>(),
    ),
    BlocProvider(
      create: (_) => sl<ClassRoomDetailBloc>(),
    ),
    BlocProvider(
      create: (_) => sl<SubjectListBloc>(),
    ),
    BlocProvider(
      create: (_) => sl<FetchSubjectBloc>(),
    ),
    BlocProvider(
      create: (_) => sl<RegistrationBloc>(),
    ),
  ], child: await builder()));
}
