import 'package:flutter/material.dart';
import 'package:meals/datas/dummy_datas.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/mealsdummy.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_item_grid.dart';

class Categories extends StatefulWidget {
  const Categories({super.key, required this.onfiltered});

  final List<Meal> onfiltered;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationCOntriller;
//late means intially it does not have its values
// - it will get once it excicutets
  @override
  void initState() {
    super.initState();
    _animationCOntriller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    _animationCOntriller.forward();
  }

  @override
  void dispose() {
    //disposing controller to avoid memmory overflow
    _animationCOntriller.dispose();
    super.dispose();
  }

  void _selectedcategoroy(BuildContext context, Category selectedone) {
    final filteredlist = widget.onfiltered
        .where((meal) => meal.categories.contains(selectedone.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) =>
                MealsScreen(title: selectedone.title, meals: filteredlist)));
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (ctx) => const MealsScreen(title: 'Selected', meals: [])));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationCOntriller,
        child: GridView(
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
        ),
        builder: (context, child) => Padding(
            padding:
                EdgeInsets.only(top: 100 - _animationCOntriller.value * 100),child: child,));
  }
}
