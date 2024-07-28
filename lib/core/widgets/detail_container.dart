import 'package:flutter/material.dart';
import 'package:hamon_test/core/extentions/context_extentions.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.subtitle2});
  final String title;
  final String subtitle;
  final String subtitle2;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            minRadius: 30,
            child: Icon(Icons.person),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle2,
            style: context.textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
