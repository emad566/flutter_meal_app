import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/shared/components.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal item;
  const MealDetailsScreen({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: myText(item.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(item);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                item.imageUrl,
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
                itemCount: item.steps.length,
                itemBuilder: (BuildContext context, int index) {
                  String step = item.steps[index];
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
        itemCount: item.ingredients.length,
        itemBuilder: (BuildContext context, int index) {
          String ingredient = item.ingredients[index];
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
