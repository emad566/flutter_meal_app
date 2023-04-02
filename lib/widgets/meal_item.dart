import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/shared/components.dart';

// ignore: must_be_immutable
class MealItem extends StatelessWidget {
  Meal item;
  MealItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return InkWell(
      onTap: (){

      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    item.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  child: Container(
                    width: queryData.size.width -40,
                    padding: EdgeInsets.all(20),
                    color: Colors.black.withOpacity(.5),
                    child: myText(item.title, style: TextStyle(color: Colors.white)),
                  ),
                  bottom: 20,
                  left: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
