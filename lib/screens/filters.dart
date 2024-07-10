import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() {
    return _FavouriteState();
  }
}

class _FavouriteState extends ConsumerState<FilterScreen> {
  var glutenswitchvalue = false;
  var lactoseswitchvalue = false;
  var vegetarianswitchvalue = false;
  var veganswitchvalue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final activefilter = ref.read(filtersProvider);
    //it assigns the values to the filter bool values to this variable
    glutenswitchvalue = activefilter[Filter.glutenFree]!;
    lactoseswitchvalue = activefilter[Filter.lactoseFree]!;
    vegetarianswitchvalue = activefilter[Filter.vegetarian]!;
    veganswitchvalue = activefilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
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
      body: PopScope(
        canPop: false,
        onPopInvoked: (ispop) async {
          if (ispop) return;
          // now returning those values when the user pres  the back buttton

          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: glutenswitchvalue,
            Filter.lactoseFree: lactoseswitchvalue,
            Filter.vegetarian: vegetarianswitchvalue,
            Filter.vegan: veganswitchvalue
          });

          Navigator.of(context).pop();
          // return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenswitchvalue,
              onChanged: (ischecked) {
                setState(() {
                  glutenswitchvalue = ischecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only Includes Gluten-free meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 15, left: 22),
            ),
            SwitchListTile(
              value: lactoseswitchvalue,
              onChanged: (bool ischanged) {
                setState(() {
                  lactoseswitchvalue = ischanged;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only Lactose Gluten-free meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 15, left: 22),
            ),
            SwitchListTile(
              value: vegetarianswitchvalue,
              onChanged: (bool ischanged) {
                setState(() {
                  vegetarianswitchvalue = ischanged;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only Includes vegetarian meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 15, left: 22),
            ),
            SwitchListTile(
              value: veganswitchvalue,
              onChanged: (bool ischanged) {
                setState(() {
                  veganswitchvalue = ischanged;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only Includes Vegan meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 15, left: 22),
            )
          ],
        ),
      ),
    );
  }
}
