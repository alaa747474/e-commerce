import 'package:flutter/material.dart';

class Errorwidget extends StatelessWidget {
  const Errorwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something went Wrong',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
