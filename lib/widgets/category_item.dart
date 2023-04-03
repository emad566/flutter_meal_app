import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/category.dart';
import 'package:flutter_meal_app/screens/meal_screen.dart';
import 'package:flutter_meal_app/shared/components.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  final CategoryModel item;
  const CategoryItem({Key? key, required this.item}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      onTap: (){
        navigateTo(context, CategoryMealScreen(catItem: item));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: item.color,
        ),
        padding: const EdgeInsets.all(10.0),
        child: myText(item.title, style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}
