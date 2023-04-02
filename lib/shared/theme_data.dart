import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.pink,
  canvasColor: const Color.fromRGBO(255, 254, 229, 1),
  textTheme: ThemeData.light().textTheme.copyWith(
    bodySmall: const TextStyle(
      color: Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'RobotoCondensed',
    ),
    bodyMedium: const TextStyle(
      color: Color.fromRGBO(255, 55, 0, 1),
    ),
    bodyLarge: const TextStyle(
      color: Color.fromRGBO(254, 6, 70, 1),
    ),
  ),
);