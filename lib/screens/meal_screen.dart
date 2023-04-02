import 'package:flutter/material.dart';
import 'package:flutter_meal_app/dummy_data.dart';
import 'package:flutter_meal_app/models/category.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/shared/components.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

// ignore: must_be_immutable
class CategoryMealScreen extends StatelessWidget {
  CategoryModel catItem;
  List<Meal> meals = [];
  CategoryMealScreen({Key key, @required this.catItem}) : super(key: key){
    meals = DUMMY_MEALS.where((Meal meal) => meal.categories.contains(catItem.id)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: myText(catItem.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (BuildContext context, int index){
            return MealItem(item: meals[index]);
          }
        ),
      ),
    );
  }
}
