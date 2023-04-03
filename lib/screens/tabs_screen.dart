import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/category_screen.dart';
import 'package:flutter_meal_app/screens/favorites_screen.dart';
import 'package:flutter_meal_app/shared/components.dart';
import 'package:flutter_meal_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentTabIndex = 0;
  List<Map<String, dynamic>> screens = [
    {
      'screen': const CategoryScreen(),
      'title': 'Categories',
    },
    {
      'screen': const FavoritesScreen(),
      'title': 'Favorites',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: myText(screens[currentTabIndex]['title']),
      ),
      body: screens[currentTabIndex]['screen'],
      drawer: const AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: currentTabIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).canvasColor,
        selectedItemColor: Theme.of(context).textTheme.titleSmall?.color,
      ),
    );
  }
}
