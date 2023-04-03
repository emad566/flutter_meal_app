import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/tabs_screen.dart';
import 'package:flutter_meal_app/shared/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Meal App',
      theme: lightTheme,
      home:  const TabsScreen(),
    );
  }
}



