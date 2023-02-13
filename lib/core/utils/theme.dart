import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  return  TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 34.sp,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18.sp,
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 16.sp,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
    ),
    headline6: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      height: 1.75.h,
      fontSize: 12.sp,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 10.sp,
    ),
  );
}
