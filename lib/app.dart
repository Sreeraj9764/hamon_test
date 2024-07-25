import 'package:flutter/material.dart';
import 'package:hamon_test/core/app_core.dart';
import 'package:hamon_test/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      theme: AppTheme.appTheme,
      routerConfig: AppRouter.router(),
    );
  }
}
