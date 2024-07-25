import 'package:flutter/material.dart';
import 'package:hamon_test/core/theme/app_pallete.dart';
import 'package:hamon_test/core/widgets/hamon_appbar.dart';

class HamonScaffold extends StatelessWidget {
  const HamonScaffold(
      {super.key,
      this.appBar,
      required this.body,
      this.bottom,
      this.backgrondColor});
  final HamonAppbar? appBar;
  final Widget body;
  final Widget? bottom;
  final Color? backgrondColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrondColor ?? AppPallete.backgroundColor,
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottom,
    );
  }
}
