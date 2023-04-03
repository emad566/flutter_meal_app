import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/shared/cache_helper.dart';
import 'package:flutter_meal_app/shared/components.dart';

class MealDetailsScreen extends StatefulWidget {
  final Meal item;
  const MealDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  List<dynamic> favMealIds = [];
  @override
  void initState() {
    super.initState();
    if(CacheHelper.getData('favMealIds') != null){
      favMealIds = jsonDecode(CacheHelper.getData('favMealIds'));
    }
  }

  void toggleFavMealIds(){
    setState(() {
      (favMealIds.contains(widget.item.id))? favMealIds.remove(widget.item.id) : favMealIds.add(widget.item.id);
      CacheHelper.setData('favMealIds', jsonEncode(favMealIds));
    });
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: myText(widget.item.title),
        actions: [
          IconButton(
            onPressed: (){
              toggleFavMealIds();
            },
            icon: Icon(
              Icons.star,
              color: favMealIds.contains(widget.item.id) ?
                  Theme.of(context).textTheme.titleSmall?.color
                  : Theme.of(context).canvasColor,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(widget.item);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                widget.item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle('Ingredients'),
            buildIngredientsItems(queryData),
            buildTitle('Steps'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10.0),
              height: 200,
              width: queryData.size.width * .9,
              child: ListView.builder(
                itemCount: widget.item.steps.length,
                itemBuilder: (BuildContext context, int index) {
                  String step = widget.item.steps[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index+1}'),
                    ),
                    title: myText(step, style: const TextStyle(fontSize: 20)),
                  );
                },
              ),
            ),
            const SizedBox(height: 50,),

          ],
        ),
      ),
    );
  }

  Container buildIngredientsItems(MediaQueryData queryData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10.0),
      height: 200,
      width: queryData.size.width * .9,
      child: ListView.builder(
        itemCount: widget.item.ingredients.length,
        itemBuilder: (BuildContext context, int index) {
          String ingredient = widget.item.ingredients[index];
          return Card(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 15),
              child: myText(ingredient,
                  style:
                      const TextStyle(color: Colors.white, fontSize: 16)),
            ),
          );
        },
      ),
    );
  }

  Container buildTitle(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: myText(title, style: const TextStyle(fontWeight: FontWeight.bold,)),
    );
  }
}
