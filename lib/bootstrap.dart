import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon_test/features/classroom/presentation/blocs/classroom_bloc.dart';
import 'package:hamon_test/features/subjects/presentation/blocs/subject_bloc.dart';

import 'core/app_core.dart';
import 'features/students/presentation/blocs/students_bloc.dart';

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
      create: (_) => sl<StudentsBloc>(),
    ),
    BlocProvider(
      create: (_) => sl<ClassRoomBloc>(),
    ),
    BlocProvider(
      create: (_) => sl<SubjectBloc>(),
    ),
  ], child: await builder()));
}
