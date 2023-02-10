import 'package:flutter/material.dart';

showCustomSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.blueGrey[900], content: Text(content)));
}

