import 'package:flutter/material.dart';
import 'package:flutter_meal_app/shared/components.dart';
import 'package:flutter_meal_app/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {

  const FilterScreen({Key key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGluten = false;

  bool isLactose = false;

  bool isVegetarian = false;

  bool isVegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: myText('Filter'),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: myText('Adjust your meal selection.'),
              ),
              buildSwitchListTile(
                context,
                title: 'Gluten',
                subtitle: 'Only includes Gluten meal',
                value: isGluten,
                onChange: (){
                 setState(() {
                   isGluten = !isGluten;
                 });
                },
              ),
              buildSwitchListTile(
                context,
                title: 'Lactose',
                subtitle: 'Only includes Lactose meal',
                value: isLactose,
                onChange: (){
                 setState(() {
                   isLactose = !isLactose;
                 });
                },
              ),
              buildSwitchListTile(
                context,
                title: 'Vegetarian',
                subtitle: 'Only includes Vegetarian meal',
                value: isVegetarian,
                onChange: (){
                 setState(() {
                   isVegetarian = !isVegetarian;
                 });
                },
              ),
              buildSwitchListTile(
                context,
                title: 'Vegan',
                subtitle: 'Only includes Vegan meal',
                value: isVegan,
                onChange: (){
                 setState(() {
                   isVegan = !isVegan;
                 });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SwitchListTile buildSwitchListTile(BuildContext context, {@required title, @required subtitle, @required bool value, @required Function onChange }) {
    return SwitchListTile(
      value: value,
      onChanged: (_){onChange();},
      title: myText(title),
      subtitle: Text(subtitle, style: TextStyle(color:Theme.of(context).primaryColor),),
      activeColor: Theme.of(context).textTheme.titleSmall.color,

    );
  }
}
