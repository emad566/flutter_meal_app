import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/screens/meal_detail_screen.dart';
import 'package:flutter_meal_app/shared/components.dart';

// ignore: must_be_immutable
class MealItem extends StatelessWidget {
  Meal item;
  final Function removeItem;
  MealItem({Key? key, required this.item, required this.removeItem}) : super(key: key);

  String get complexityText{
    switch(item.complexity){
      case Complexity.simple: return 'Simple';
      case Complexity.challenging: return 'Challenging';
      case Complexity.hard: return 'Hard';
      default: return 'Unknown';
    }
  }

  String get affordability{
    switch(item.affordability){
      case Affordability.affordable: return 'Affordable';
      case Affordability.luxurious: return 'Luxurious';
      case Affordability.pricey: return 'Pricey';
      default: return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) {
            return MealDetailsScreen(item: item);
          }),
        ).then((value){
          removeItem(value);
        });

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
                  bottom: 20,
                  left: 20,
                  child: Container(
                    width: queryData.size.width -40,
                    padding: const EdgeInsets.all(20),
                    color: Colors.black.withOpacity(.5),
                    child: myText(item.title, style: const TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6,),
                      Text('${item.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6,),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6,),
                      Text(affordability),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
