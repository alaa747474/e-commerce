import 'package:flutter/material.dart';

showCustomSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.blueGrey[900], content: Text(content)));
}

showErorrDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child:Container(width: 300,height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blueGrey
      ),
      child: Center(child: 
      Text('Something went wrong, try again'),),
      )
    ),
  );
}
