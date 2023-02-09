import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    hintColor: Colors.grey[400],
    backgroundColor: Colors.white,
    primaryColor: const Color.fromARGB(255, 104, 118, 198),
    cardColor: const Color.fromARGB(255, 104, 118, 198),
    scaffoldBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    headline6: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      height: 1.75,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    ),
  );
}
