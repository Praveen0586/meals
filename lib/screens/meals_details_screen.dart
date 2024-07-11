import 'package:flutter/material.dart';
import 'package:meals/models/mealsdummy.dart';
import 'package:meals/provider/faviroutes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealdetailsScreen extends ConsumerWidget {
  const MealdetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(faviroutesprovider);

    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
              onPressed: () {
                // we triger the fuction with provider

                final isAdded = ref
                    .read(faviroutesprovider.notifier)
                    .toggleforfaviroute(meal);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(isAdded
                        ? 'Marked as a favorite.'
                        : "This meal is no longer my favorite")));
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                ),
              ),
            )
          ],
        ),
        body: ListView(children: [
          Column(
            children: [
              Hero(tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
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
