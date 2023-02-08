import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.priority_high_rounded,
          color: Theme.of(context).primaryColor,
          size: 100,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Theme.of(context).primaryColor),
        )
      ],
    );
  }
}
