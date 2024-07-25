import 'package:go_router/go_router.dart';
import 'package:hamon_test/features/classroom/presentation/pages/class_room_list.dart';
import 'package:hamon_test/features/students/presentation/pages/students_list_page.dart';
import 'features/home/presentation/pages/home_page.dart';

class AppRouter {
  static const homePath = "/";
  static const studentsList = "studentsList";
  static const classRoomList = "classRoomList";
  static const subjects = "subjects";
  static const registration = "registration";
  static router() => GoRouter(
        initialLocation: homePath,
        routes: [
          GoRoute(
              path: '/',
              name: "Home",
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: studentsList,
                  name: "Students",
                  builder: (context, state) => const StudentsListPage(),
                ),
                GoRoute(
                  path: classRoomList,
                  name: "Classroom",
                  builder: (context, state) => const ClassRoomsList(),
                ),
                // GoRoute(
                //   path: subjects,
                //   name: "Subjects",
                //   builder: (context, state) => const SubjectPage(),
                // ),
                // GoRoute(
                //   path: '/register',
                //   builder: (context, state) => const RegisterPage(),
                // ),
              ]),
        ],
      );
}
