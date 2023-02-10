
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.color,
    required this.images, required this.text,
  }) : super(key: key);

  final Color color;
  final String images;
final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 40,
          child: Image.asset(
            images,
            width: 50,
            height: 50,
          ),
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5,
        ),
      ],
    );
  }
}