import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/core/theme/app_pallete.dart';
import 'package:hamon_test/features/home/presentation/widgets/home_container.dart';
import 'package:hamon_test/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HamonScaffold(
      appBar: const HamonAppbar(),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          mainAxisSpacing: 20,
          childAspectRatio: 4 / 5,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeContainer(
              iconData: Icons.person,
              title: "Students",
              onPressed: () => context.go("/${AppRouter.studentsList}"),
              color: AppPallete.studenthomeCard,
            ),
            HomeContainer(
              iconData: Icons.book,
              title: "Subjects",
              onPressed: () {},
              color: AppPallete.subjecthomeCard,
            ),
            HomeContainer(
              iconData: Icons.roofing_rounded,
              title: "Class Room",
              onPressed: () {},
              color: AppPallete.classroomhomeCard,
            ),
            HomeContainer(
              iconData: Icons.app_registration,
              title: "Register",
              onPressed: () {},
              color: AppPallete.registrationhomeCard,
            ),
          ],
        ),
      ),
    );
  }
}
