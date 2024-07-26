import 'package:flutter/material.dart';
import 'package:hamon_test/core/extentions/context_extentions.dart';
import 'package:hamon_test/core/theme/app_pallete.dart';

class HmCard extends StatelessWidget {
  const HmCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.trailing,
      this.onTap});
  final String title, subtitle;
  final Widget trailing;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap?.call(),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      tileColor: AppPallete.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
      ),
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: context.textTheme.titleLarge?.copyWith(fontSize: 14),
          ),
          Text(
            subtitle,
            style: context.textTheme.titleMedium?.copyWith(fontSize: 12),
          )
        ],
      ),
      trailing: trailing,
    );
  }
}
