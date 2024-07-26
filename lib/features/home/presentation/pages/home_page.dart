import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/core/theme/app_pallete.dart';
import 'package:hamon_test/features/home/presentation/widgets/home_container.dart';
import 'package:hamon_test/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool listMode = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HamonScaffold(
      appbar: HamonAppbar(
        toolBarHeight: 75,
        action: GestureDetector(
            onTap: () => setState(() => listMode = !listMode),
            child: ActionButton(
              listMode: listMode,
            )),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: listMode ? 1 : 2,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          mainAxisSpacing: 20,
          childAspectRatio: listMode ? 16 / 5 : 4 / 5,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeContainer(
              imgPath: "assets/images/student_icon.png",
              title: "Students",
              onPressed: () => context.go("/${AppRouter.studentsList}"),
              color: AppPallete.studenthomeCard,
            ),
            HomeContainer(
              imgPath: "assets/images/subject_icon.png",
              title: "Subjects",
              onPressed: () => context.go("/${AppRouter.subjects}"),
              color: AppPallete.subjecthomeCard,
            ),
            HomeContainer(
              imgPath: "assets/images/classroom_icon.png",
              title: "Class Room",
              onPressed: () => context.go("/${AppRouter.classRoomList}"),
              color: AppPallete.classroomhomeCard,
            ),
            HomeContainer(
              imgPath: "assets/images/registration_icon.png",
              title: "Register",
              onPressed: () => context.go("/${AppRouter.registration}"),
              color: AppPallete.registrationhomeCard,
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.listMode,
  });
  final bool listMode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Icon(
        listMode ? Icons.grid_view_outlined : Icons.menu,
        size: 32,
      ),
    );
  }
}
