import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/tabs_screen.dart';
import 'package:flutter_meal_app/shared/cache_helper.dart';
import 'package:flutter_meal_app/shared/theme_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Meal App',
      theme: lightTheme,
      home:  const TabsScreen(),
    );
  }
}



