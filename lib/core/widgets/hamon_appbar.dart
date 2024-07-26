import 'package:flutter/material.dart';
import 'package:hamon_test/core/extentions/context_extentions.dart';

class HamonAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HamonAppbar({super.key, this.toolBarHeight, this.action});
  final double? toolBarHeight;
  final Widget? action;
  @override
  Widget build(BuildContext context) {
    bool canPop = Navigator.canPop(context);
    return AppBar(
      title: canPop
          ? null
          : RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Hello,\n", style: context.textTheme.headlineLarge),
                TextSpan(
                    text: "Good Morning",
                    style: context.textTheme.headlineMedium)
              ]),
            ),
      toolbarHeight: toolBarHeight ?? kToolbarHeight,
      centerTitle: false,
      leading: canPop
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      actions: action != null ? [action!] : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight ?? kToolbarHeight);
}
