
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          radius: 40.r,
          child: Image.asset(
            images,
            width: 50.w,
            height: 50.h,
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