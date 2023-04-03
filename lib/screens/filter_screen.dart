import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_meal_app/shared/cache_helper.dart';
import 'package:flutter_meal_app/shared/components.dart';
import 'package:flutter_meal_app/widgets/app_drawer.dart';

// ignore: must_be_immutable
class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late Map<String, dynamic>? filters;

  @override
  void initState() {
    super.initState();

    if(CacheHelper.getData('filters') == null){
      filters = {
        'gluten': true,
        'lactose': true,
        'vegetarian': true,
        'vegan': true,
      };
      cacheData();
    }else{
      filters = jsonDecode(CacheHelper.getData('filters'));
    }
  }

  void cacheData(){
    CacheHelper.setData('filters', jsonEncode(filters!));
  }

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
                value: filters!['gluten']!,
                onChange: (){
                 setState(() {
                   filters!['gluten'] = !filters!['gluten']!;
                   cacheData();
                 });
                },
              ),
              buildSwitchListTile(
                context,
                title: 'Lactose',
                subtitle: 'Only includes Lactose meal',
                value: filters!['lactose']!,
                onChange: (){
                 setState(() {
                   filters!['lactose'] = !filters!['lactose']!;
                   cacheData();
                 });
                },
              ),
              buildSwitchListTile(
                context,
                title: 'Vegetarian',
                subtitle: 'Only includes Vegetarian meal',
                value: filters!['vegetarian']!,
                onChange: (){
                 setState(() {
                   filters!['vegetarian'] = !filters!['vegetarian']!;
                   cacheData();
                 });
                },
              ),
              buildSwitchListTile(
                context,
                title: 'Vegan',
                subtitle: 'Only includes Vegan meal',
                value: filters!['vegan']!,
                onChange: (){
                 setState(() {
                   filters!['vegan'] = !filters!['vegan']!;
                   cacheData();
                 });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SwitchListTile buildSwitchListTile(BuildContext context, {required title, required subtitle, required bool value, required Function onChange }) {
    return SwitchListTile(
      value: value,
      onChanged: (_){onChange();},
      title: myText(title),
      subtitle: Text(subtitle, style: TextStyle(color:Theme.of(context).primaryColor),),
      activeColor: Theme.of(context).textTheme.titleSmall?.color,

    );
  }
}
