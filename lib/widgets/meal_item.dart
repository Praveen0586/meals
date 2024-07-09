import 'package:flutter/material.dart';
import 'package:meals/models/mealsdummy.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealitem extends StatelessWidget {
  const Mealitem({super.key, required this.meal, required this.onselected});
  final Meal meal;
  final void Function(BuildContext context, Meal meal) onselected;
  String get complexitynamecapitalizer {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilitynamecapitalizer {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 25,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onselected(context,meal);
        },
        // borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: const Color.fromARGB(137, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      softWrap: true,
                      meal.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.shutter_speed_outlined,
                            lable: meal.duration.toString()),
                        const SizedBox(
                          width: 18,
                        ),
                        MealItemTrait(
                            icon: Icons.workspace_premium_rounded,
                            lable: complexitynamecapitalizer),
                        const SizedBox(
                          width: 18,
                        ),
                        MealItemTrait(
                            icon: Icons.attach_money_rounded,
                            lable: affordabilitynamecapitalizer),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
