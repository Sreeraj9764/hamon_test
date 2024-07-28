part of 'di_container.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _globalDependdancies();
  _initStudent();
  _initClassroom();
  _initSubjects();
  _initRegistration();
}

void _globalDependdancies() {
  sl
    ..registerFactory(() => InternetConnection())
    ..registerFactory(
      () => Dio(),
    )
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
    () => StudentRemoteDataSourceImpl(client: DioClient(sl())),
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
  sl.registerLazySingleton(() => StudentsListBloc(getStudents: sl()));
  sl.registerLazySingleton(() => StudentsDetailBloc(fetchStudent: sl()));
}

void _initClassroom() {
  //Datasoure
  sl.registerFactory<ClassRoomRemoteDataSource>(
    () => ClassRoomRemoteDataSourceImpl(client: DioClient(sl())),
  );
  //Repository
  sl.registerFactory<ClassRoomRepository>(
    () => ClassRoomRepositoryImpl(
        classroomRemoteDataSource: sl(), connectionChecker: sl()),
  );
  //Usecases
  sl
    ..registerFactory(() => GetClassRoom(sl()))
    ..registerFactory(
      () => FetchClassRoom(sl()),
    );

  //Bloc
  sl.registerLazySingleton(
      () => ClassRoomListBloc(fetchClassRoom: sl(), getClassRoom: sl()));
}

void _initSubjects() {
  //Datasoure
  sl.registerFactory<SubjectRemoteDataSource>(
    () => SubjectRemoteDataSourceImpl(client: DioClient(sl())),
  );
  //Repository
  sl.registerFactory<SubjectRepository>(
    () => SubjectRepositoryImpl(
        subjectRemoteDataSource: sl(), connectionChecker: sl()),
  );
  //Usecases
  sl
    ..registerFactory(() => GetSubject(sl()))
    ..registerFactory(
      () => FetchSubject(sl()),
    );

  //Bloc
  sl.registerLazySingleton(() => SubjectListBloc(getSubject: sl()));
  sl.registerLazySingleton(() => FetchSubjectBloc(fetchSubject: sl()));
}

void _initRegistration() {
  //Datasoure
  sl.registerFactory<RegistrationRemoteDataSource>(
    () => RegistrationRemoteDataSourceImpl(client: DioClient(sl())),
  );
  //Repository
  sl.registerFactory<RegistrationRepository>(
    () => RegistrationRepositoryImpl(
        registerRemoteDataSource: sl(), connectionChecker: sl()),
  );
  //Usecases
  sl
    ..registerFactory(() => GetRegistration(sl()))
    ..registerFactory(
      () => FetchRegistration(sl()),
    );

  //Bloc
  sl.registerLazySingleton(
      () => RegistrationBloc(fetchRegistration: sl(), getRegistration: sl()));
}
