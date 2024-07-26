import 'package:flutter/material.dart';
import 'package:hamon_test/core/theme/app_pallete.dart';
import 'package:hamon_test/core/widgets/hamon_appbar.dart';

class HamonScaffold extends StatelessWidget {
  const HamonScaffold(
      {super.key,
      required this.body,
      this.bottom,
      this.backgrondColor,
      this.appbar});

  final Widget body;
  final Widget? bottom;
  final Color? backgrondColor;
  final HamonAppbar? appbar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrondColor ?? AppPallete.backgroundColor,
      appBar: appbar ?? const HamonAppbar(),
      body: body,
      bottomNavigationBar: bottom,
    );
  }
}
