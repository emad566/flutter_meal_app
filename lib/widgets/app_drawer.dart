import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/filter_screen.dart';
import 'package:flutter_meal_app/screens/tabs_screen.dart';
import 'package:flutter_meal_app/shared/components.dart';

// ignore: must_be_immutable
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).textTheme.titleSmall?.color,
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Cocking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          buildDrawerItem(
            context,
            title: 'Meals',
            icon: Icons.restaurant,
            screen: const TabsScreen(),
          ),
          buildDrawerItem(
            context,
            title: 'Filters',
            icon: Icons.filter_alt_outlined,
            screen: const FilterScreen(),
          ),
        ],
      ),
    );
  }

  ListTile buildDrawerItem(BuildContext context,
      {required String title, required IconData icon, Widget? screen}) {
    return ListTile(
      leading: Icon(icon, size: 30,),
      title: myText(title),
      onTap: () {
        if (screen == null) return;
        navigateReplaceTo(context, screen);
      },
      trailing: const Icon(Icons.next_plan),
    );
  }
}
