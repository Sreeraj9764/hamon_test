import 'package:flutter/material.dart';
import 'package:hamon_test/core/extentions/context_extentions.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            minRadius: 10,
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
          )
        ],
      ),
    );
  }
}
