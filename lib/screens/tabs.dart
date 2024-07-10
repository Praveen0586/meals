import 'package:flutter/material.dart';

import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/faviroutes_provider.dart';
import 'package:meals/provider/filters_provider.dart';

const kintialvalues = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _currentpageindex = 0;

//must write this above declaration as outside the build column
//because whenever the setstate exicutes the build is re- redered
//sot the program wont be chnage - so we need to write this Declaration outisde
  @override
  Widget build(BuildContext context) {
  
    //now macking the filter logic

    //with the help of the provider
    final filteredList = ref.watch(filteredMealsProvider);
    final avilablemeals = filteredList;
    void _onselectedscreen(String identiier) async {
      Navigator.of(context).pop();
      if (identiier == 'Filters') {
        await Navigator.of(context)
            .push<Map<Filter, bool>>(//declaring the keytype and returntype
                MaterialPageRoute(builder: (ctx) => const FilterScreen()));
      }
    }

    // //or
    //   setState(() {
    //     if (isExcess) {
    //       //condtion if True

    //       myfaviroutes.remove(meal);
    //       _onsnackbarMessage('This meal is no longer my favorite');
    //     } else {
    //       //for false
    //       myfaviroutes.add(meal);
    //       _onsnackbarMessage('Marked as a favorite.');
    //     }
    //   });
    // }

    String currentpagetitle = 'Categories';
    Widget currentscreen = Categories(onfiltered: avilablemeals);

    void changescreen(int index) {
      setState(() {
        _currentpageindex = index;
      });
    }

    if (_currentpageindex == 1) {
      final myfaviroutemealprovider = ref.watch(faviroutesprovider);
      currentscreen = MealsScreen(meals: myfaviroutemealprovider);
      currentpagetitle = 'Favourite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(currentpagetitle),
      ),
      drawer: MainDrawer(
        onselectedscreen: _onselectedscreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changescreen,
        currentIndex: _currentpageindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_rate_outlined), label: 'Favourite')
        ],
      ),
      body: currentscreen,
    );
  }
}
