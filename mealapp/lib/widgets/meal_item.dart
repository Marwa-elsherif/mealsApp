import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.id,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
        break;
      case Complexity.challenging:
        return 'challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknowen';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.luxurious:
        return 'luxurious';
        break;
      case Affordability.pricey:
        return 'pricey';
        break;
      default:
        return 'unknowen';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailsScreen.routName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect //to force the image to take border radius
                      (
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 8,
                        ),
                        Text("$duration min"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 8,
                        ),
                        Text("$complexityText"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 8,
                        ),
                        Text("$affordabilityText"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
