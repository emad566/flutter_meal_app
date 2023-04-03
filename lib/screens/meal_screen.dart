import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_meal_app/dummy_data.dart';
import 'package:flutter_meal_app/models/category.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/shared/cache_helper.dart';
import 'package:flutter_meal_app/shared/components.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

// ignore: must_be_immutable
class CategoryMealScreen extends StatefulWidget {
  CategoryModel catItem;
  List<Meal> meals = [];
  CategoryMealScreen({Key? key, required this.catItem}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    late Map<String, dynamic>? filters;
    widget.meals = dummyMeals.where((Meal meal) => meal.categories.contains(widget.catItem.id)).toList();

    if(CacheHelper.getData('filters') != null){
      filters = jsonDecode(CacheHelper.getData('filters'));
      widget.meals = widget.meals.where((Meal meal){
        bool flag = false;
        if(meal.isGlutenFree == filters!['gluten']) flag = true;
        if(meal.isVegan == filters['vegan']) flag = true;
        if(meal.isVegetarian == filters['vegetarian']) flag = true;
        if(meal.isLactoseFree == filters['lactoseFree']) flag = true;
        return flag;
      }).toList();
    }
  }

  void removeItem(Meal meal){
    setState(() {
      widget.meals.removeWhere((Meal m) => meal.id == m.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: myText(widget.catItem.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.meals.length,
          itemBuilder: (BuildContext context, int index){
            return MealItem(item: widget.meals[index], removeItem: removeItem,);
          }
        ),
      ),
    );
  }
}
