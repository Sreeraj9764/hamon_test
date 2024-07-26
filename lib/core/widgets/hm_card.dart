import 'package:flutter/material.dart';
import 'package:hamon_test/core/theme/app_pallete.dart';

class HmCard extends StatelessWidget {
  const HmCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: 358,
      height: 66,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppPallete.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
