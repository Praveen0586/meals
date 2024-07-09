import 'package:flutter/material.dart';

import 'package:meals/models/category.dart';

class CategoryItemGrid extends StatelessWidget {
  const CategoryItemGrid(this.ontapping,{super.key, required this.category});
  final Category category;
  final void Function() ontapping;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontapping,
        borderRadius: BorderRadius.circular(16),
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [
                category.color.withOpacity(0.75),
                category.color.withOpacity(0.5)
              ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        ));
  }
}
