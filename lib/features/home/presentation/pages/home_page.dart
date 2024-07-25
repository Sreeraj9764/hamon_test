import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_test/features/home/presentation/widgets/home_container.dart';
import 'package:hamon_test/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1 / 2,
          children: [
            HomeContainer(
              iconData: Icons.person,
              title: "Students",
              onPressed: () => context.go(AppRouter.studentsList),
            ),
            HomeContainer(
              iconData: Icons.book,
              title: "Subjects",
              onPressed: () {},
            ),
            HomeContainer(
              iconData: Icons.roofing_rounded,
              title: "Class Room",
              onPressed: () {},
            ),
            HomeContainer(
              iconData: Icons.app_registration,
              title: "Register",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
