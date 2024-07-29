import 'package:go_router/go_router.dart';
import 'package:hamon_test/features/classroom/presentation/pages/classroom_details_page.dart';
import 'package:hamon_test/features/classroom/presentation/pages/classroom_list_page.dart';
import 'package:hamon_test/features/registration/presentation/pages/registration_list_page.dart';
import 'package:hamon_test/features/students/presentation/pages/student_detail_page.dart';
import 'package:hamon_test/features/students/presentation/pages/students_list_page.dart';
import 'package:hamon_test/features/subjects/presentation/pages/subject_details_page.dart';
import 'package:hamon_test/features/subjects/presentation/pages/subject_list_page.dart';
import 'features/home/presentation/pages/home_page.dart';

class AppRouter {
  static const homePath = "/";
  static const studentsList = "studentsList";
  static const studentDetails = "studentDetails";
  static const classRoomList = "classRoomList";
  static const classRoomDetail = "classRoomDetail";
  static const subjectList = "subjectList";
  static const subjectDetail = "subjectList";
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
                    routes: [
                      GoRoute(
                        path: studentDetails,
                        name: "studentDetails",
                        builder: (context, state) => const StudentDetailPage(),
                      ),
                    ]),
                GoRoute(
                    path: classRoomList,
                    name: "Classroom",
                    builder: (context, state) => const ClassRoomListPage(),
                    routes: [
                      GoRoute(
                        path: classRoomDetail,
                        name: "classRoomDetail",
                        builder: (context, state) =>
                            const ClassroomDetailsPage(),
                      ),
                    ]),
                GoRoute(
                  path: subjectList,
                  name: "subjectList",
                  builder: (context, state) => const SubjectListPage(),
                  routes: [
                    GoRoute(
                      path: subjectDetail,
                      name: "subjectDetail",
                      builder: (context, state) => const SubjectDetailPage(),
                    ),
                  ],
                ),
                GoRoute(
                  path: registration,
                  builder: (context, state) => const RegistrationListPage(),
                ),
              ]),
        ],
      );
}
