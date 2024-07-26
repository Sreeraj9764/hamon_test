import 'package:flutter/material.dart';
import 'package:hamon_test/core/extentions/context_extentions.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.imgPath,
    required this.title,
    required this.onPressed,
    required this.color,
  });

  final String imgPath;
  final String title;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgPath),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: context.textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
