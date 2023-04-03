import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_meal_app/dummy_data.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/shared/cache_helper.dart';
import 'package:flutter_meal_app/shared/components.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<dynamic> favMealIds = [];
  List<Meal> favMeals = [];

  @override
  void initState() {
    super.initState();
    if (CacheHelper.getData('favMealIds') != null) {
      favMealIds = jsonDecode(CacheHelper.getData('favMealIds'));
    }
    favMeals =
        dummyMeals.where((Meal meal) => favMealIds.contains(meal.id)).toList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: favMeals.isEmpty
            ? myText('No Favorite data')
            : ListView.builder(
                itemCount: favMeals.length,
                itemBuilder: (BuildContext context, int index) {
                  return MealItem(
                    item: favMeals[index],
                    removeItem: (_) {
                      setState(() {
                        if (CacheHelper.getData('favMealIds') != null) {
                          favMealIds = jsonDecode(CacheHelper.getData('favMealIds'));
                        }
                        favMeals =
                            dummyMeals.where((Meal meal) => favMealIds.contains(meal.id)).toList();                      });
                    },
                  );
                }),
      ),
    );
  }
}
