import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilterModeValues});
  final Map<Filter, bool> currentFilterModeValues;
  @override
  State<FilterScreen> createState() {
    return _FavouriteState();
  }
}

class _FavouriteState extends State<FilterScreen> {
  var glutenswitchvalue = false;
  var lactoseswitchvalue = false;
  var vegetarianswitchvalue = false;
  var veganswitchvalue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    glutenswitchvalue = widget.currentFilterModeValues[Filter.glutenFree]!;
    lactoseswitchvalue = widget.currentFilterModeValues[Filter.lactoseFree]!;
    vegetarianswitchvalue = widget.currentFilterModeValues[Filter.vegetarian]!;
    veganswitchvalue = widget.currentFilterModeValues[Filter.vegan]!;
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
        onPopInvoked: (ispop) {
          if (ispop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: glutenswitchvalue,
            Filter.lactoseFree: lactoseswitchvalue,
            Filter.vegetarian: vegetarianswitchvalue,
            Filter.vegan: veganswitchvalue
          });
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
