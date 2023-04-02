import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/category.dart';
import 'package:flutter_meal_app/shared/components.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  final CategoryModel item;
  const CategoryItem({Key key, this.item}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: item.color,
        ),
        padding: const EdgeInsets.all(10.0),
        child: myText(item.title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}