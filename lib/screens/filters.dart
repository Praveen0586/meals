import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      // drawer: MainDrawer(onselectedscreen: //directly writing the fuction here
      //     (String identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'Meal') {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(
      //       builder: (ctx) => const TabScreen(),
      //     ));
      //   }
      // }),
      body: Column(
        children: [
          SwitchListTile(
            value: activefilters[Filter.glutenFree]!,
            onChanged: (ischecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setfilter(Filter.glutenFree, ischecked);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Includes Gluten-free meals',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(right: 15, left: 22),
          ),
          SwitchListTile(
            value: activefilters[Filter.lactoseFree]!,
            onChanged: (bool ischanged) {
              ref
                  .read(filtersProvider.notifier)
                  .setfilter(Filter.lactoseFree, ischanged);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Lactose Gluten-free meals',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(right: 15, left: 22),
          ),
          SwitchListTile(
            value: activefilters[Filter.vegetarian]!,
            onChanged: (bool ischanged) {
              ref
                  .read(filtersProvider.notifier)
                  .setfilter(Filter.vegetarian, ischanged);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Includes vegetarian meals',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(right: 15, left: 22),
          ),
          SwitchListTile(
            value: activefilters[Filter.vegan]!,
            onChanged: (bool ischanged) {
              ref
                  .read(filtersProvider.notifier)
                  .setfilter(Filter.vegan, ischanged);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Includes Vegan meals',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(right: 15, left: 22),
          )
        ],
      ),
    );
  }
}
