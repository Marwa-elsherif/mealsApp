import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreens extends StatefulWidget {
  static const routeName = 'categoryMealScreens';
  final List<Meal> _availableMeal;

  const CategoryMealScreens(this._availableMeal);

  @override
  _CategoryMealScreensState createState() => _CategoryMealScreensState();
}

class _CategoryMealScreensState extends State<CategoryMealScreens> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    final categoryMeals = widget._availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
