import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categoriesscreen.dart';
import 'package:mealapp/screens/favorite_screen.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreens(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': ' Your Favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
