import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs.dart';

import 'models/meal.dart';
import 'screens/categoriesscreen.dart';
import 'screens/category_meals_screens.dart';
import 'screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final _existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (_existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(_existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Colors.pink[50],
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Colors.black),
                body2: TextStyle(color: Colors.black),
                title: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed'),
              )),
      // home: MyHomePage(),
      home: TabsScreen(_favoriteMeals),
      routes: {
        'home': (context) => TabsScreen(_favoriteMeals),
        CategoryMealScreens.routeName: (context) =>
            CategoryMealScreens(_availableMeal),
        MealDetailsScreen.routName: (context) =>
            MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_setFilters, _filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: CategoriesScreens(),
    );
  }
}
