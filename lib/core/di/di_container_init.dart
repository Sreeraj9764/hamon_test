part of 'di_container.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _globalDependdancies();
  _initStudent();
}

void _globalDependdancies() {
  sl
    ..registerFactory(() => InternetConnection())
    // ..registerFactory(
    //   () => Dio(),
    // )
    ..registerFactory(
      () => DioClient(sl()),
    )
    ..registerFactory<ConnectionChecker>(
      () => ConnectionCheckerImpl(sl()),
    );
}

void _initStudent() {
  //Datasoure
  sl.registerFactory<StudentRemoteDataSource>(
    () => StudentRemoteDataSourceImpl(),
  );
  //Repository
  sl.registerFactory<StudentRepository>(
    () => StudentRepositoryImpl(
        studentRemoteDataSource: sl(), connectionChecker: sl()),
  );
  //Usecases
  sl
    ..registerFactory(() => GetStudents(sl()))
    ..registerFactory(
      () => FetchStudent(sl()),
    );

  //Bloc
  sl.registerLazySingleton(
      () => StudentsBloc(fetchStudent: sl(), getStudents: sl()));
}
