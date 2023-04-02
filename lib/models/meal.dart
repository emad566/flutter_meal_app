import 'package:flutter/cupertino.dart';

enum Complexity{
  simple,
  challenging,
  hard
}

enum Affordability{
  affordable,
  pricey,
  luxurious
}

class Meal{
  final String id;
  final List<String> categories;
  final String title;
  final List<String> ingredients;
  final String steps;
  final String duration;
  final Complexity complexity;
  final Affordability affordability;
  final String isGlutenFree;
  final String isLactoseFree;
  final String isVegan;
  final String isVegetarian;

  Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian
  });
}