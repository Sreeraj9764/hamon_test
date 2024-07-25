import 'package:flutter/material.dart';

class HamonAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HamonAppbar({super.key, this.toolBarHeight});
  final double? toolBarHeight;
  @override
  Widget build(BuildContext context) {
    bool canPop = Navigator.canPop(context);
    return AppBar(
      title: canPop
          ? null
          : RichText(
              text: const TextSpan(children: [
                TextSpan(text: "Hello\n"),
                TextSpan(text: "Good Morning")
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
