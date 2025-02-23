import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
  });

  final List<Meal> meals;
  final String? title;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealDetailsScreen(
              meal: meal,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget contentWidget = ListView.builder(
      itemBuilder:
          (context, index) => MealItem(
            meal: meals[index],
            openMealItem: (meal) {
              selectMeal(context, meal);
            },
          ),
      itemCount: meals.length,
    );

    if (meals.isEmpty) {
      contentWidget = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Beep boop.. this is empty',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }
    if (title == null) {
      return contentWidget;
    }
    return Scaffold(appBar: AppBar(title: Text(title!)), body: contentWidget);
  }
}
