import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.pink,
  canvasColor: Colors.white,
  textTheme: ThemeData.light().textTheme.copyWith(
    bodySmall: const TextStyle(
      color: Color.fromRGBO(10, 0, 10, 1),
      fontFamily: 'RobotoCondensed',
    ),
    bodyMedium: const TextStyle(
      color: Color.fromRGBO(255, 55, 0, 1),
    ),
    bodyLarge: const TextStyle(
      color: Color.fromRGBO(254, 6, 70, 1),
    ),
    titleSmall: const TextStyle(
      color: Colors.amber,
    ),
  ),
);