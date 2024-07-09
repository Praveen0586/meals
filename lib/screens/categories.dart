import 'package:flutter/material.dart';
import 'package:meals/datas/dummy_datas.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/mealsdummy.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_item_grid.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.onfiltered});
  
  final List<Meal> onfiltered;
  @override
  Widget build(BuildContext context) {
    void _selectedcategoroy(BuildContext context, Category selectedone) {
      final filteredlist = onfiltered
          .where((meal) => meal.categories.contains(selectedone.id))
          .toList();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => MealsScreen(
                 
                  title: selectedone.title,
                  meals: filteredlist)));
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (ctx) => const MealsScreen(title: 'Selected', meals: [])));
    }

    return GridView(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        //alternate for assumenddatas.map(category) =>categoryitemgrid(category: category)
        for (final category in availableCategories)
          CategoryItemGrid(() {
            _selectedcategoroy(context, category);
          }, category: category),
      ],
    );
  }
}
