import 'package:go_router/go_router.dart';
import 'package:hamon_test/features/classroom/presentation/pages/classroom_details_page.dart';
import 'package:hamon_test/features/classroom/presentation/pages/classroom_list_page.dart';
import 'package:hamon_test/features/registration/presentation/pages/subject_list_page.dart';
import 'package:hamon_test/features/students/presentation/pages/students_list_page.dart';
import 'package:hamon_test/features/subjects/presentation/pages/subject_list_page.dart';
import 'features/home/presentation/pages/home_page.dart';

class AppRouter {
  static const homePath = "/";
  static const studentsList = "studentsList";
  static const classRoomList = "classRoomList";
  static const classRoomDetail = "classRoomDetail";
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
                  builder: (context, state) => const ClassRoomListPage(),
                    routes: [
                      GoRoute(
                        path: classRoomDetail,
                        name: "classRoomDetail",
                        builder: (context, state) => ClassroomDetailsPage(
                          classRoomId: state.extra as int,
                        ),
                      ),
                    ]
                ),
                GoRoute(
                  path: subjects,
                  name: "Subjects",
                  builder: (context, state) => const SubjectListPage(),
                ),
                GoRoute(
                  path: registration,
                  builder: (context, state) => const RegistrationListPage(),
                ),
              ]),
        ],
      );
}
