import 'package:flutter/material.dart';
import 'package:meals/models/mealsdummy.dart';
import 'package:meals/screens/meals_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    void onselected(BuildContext context, Meal meale) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealdetailsScreen(
                meal: meale,
              )));
    }

    Widget content = ListView.builder(
      itemBuilder: (ctx, indeex) => Mealitem(
        meal: meals[indeex],
        onselected: onselected,
      ),
      itemCount: meals.length,
    );
    print(MediaQuery.of(context).size.width);
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('oh oh!...... the meal is Empty',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.white)),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Please select any ther category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
