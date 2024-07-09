import 'package:flutter/material.dart';
import 'package:meals/models/mealsdummy.dart';

class MealdetailsScreen extends StatelessWidget {
  const MealdetailsScreen(
      {super.key, required this.meal, required this.onChoosedAsFaviorite});
  final void Function(Meal meal) onChoosedAsFaviorite;
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
                onPressed: () {
                  onChoosedAsFaviorite(meal);
                },
                icon: const Icon(Icons.star_outlined))
          ],
        ),
        body: ListView(children: [
          Column(
            children: [
              Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Ingredient',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 12,
              ),
              for (final ingredients in meal.ingredients)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: Text(
                    ingredients,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Steps',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              for (final step in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                )
            ],
          ),
        ]));
  }
}
