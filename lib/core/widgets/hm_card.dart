import 'package:flutter/material.dart';
import 'package:hamon_test/core/theme/app_pallete.dart';

class HmCard extends StatelessWidget {
  const HmCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.trailing});
  final String title, subtitle;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      tileColor: AppPallete.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
      ),
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(
            height: 5,
          ),
          Text(subtitle)
        ],
      ),
      trailing: trailing,
    );
  }
}
