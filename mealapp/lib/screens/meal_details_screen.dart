import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routName = "mealDetailsScreen";
  final Function toggleFavorite;
  final Function isMealFavorite;
  MealDetailsScreen(this.toggleFavorite, this.isMealFavorite);
  Widget buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pinkAccent),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Steps",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(isMealFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
