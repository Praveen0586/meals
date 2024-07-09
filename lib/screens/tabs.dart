import 'package:flutter/material.dart';
import 'package:meals/datas/dummy_datas.dart';
import 'package:meals/models/mealsdummy.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/provider.dart';

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
  Map<Filter, bool> _onrecievedValues = kintialvalues;

  int _currentpageindex = 0;
  List<Meal> myfaviroutes = [];
//must write this above declaration as outside the build column
//because whenever the setstate exicutes the build is re- redered
//sot the program wont be chnage - so we need to write this Declaration outisde
  @override
  Widget build(BuildContext context) {
    final providedmeals =ref.watch(mealsProvider);
    //now macking the filter logic
    final avilablemeals = providedmeals.where((meal) {
      if (_onrecievedValues[Filter.glutenFree]! && meal.isGlutenFree) {
        print(_onrecievedValues[Filter.glutenFree]);
        print(meal.isGlutenFree);
        print(_onrecievedValues[Filter.glutenFree]! && !meal.isGlutenFree);
        return false;
      }
      if (_onrecievedValues[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_onrecievedValues[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_onrecievedValues[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    void _onselectedscreen(String identiier) async {
      Navigator.of(context).pop();
      if (identiier == 'Filters') {
        final result = await Navigator.of(context)
            .push<Map<Filter, bool>>(//declaring the keytype and returntype
                MaterialPageRoute(
                    builder: (ctx) => FilterScreen(
                          currentFilterModeValues: _onrecievedValues,
                        )));
        setState(() {
          _onrecievedValues = result ?? kintialvalues;
        });
      } else {}
    }

    void _onsnackbarMessage(String mesage) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mesage)));
    }

    void _onselectedfaviroutes(Meal meal) {
//first checking the fuction that if it is already on the faviroute list
      final isExcess = myfaviroutes.contains(meal);
      if (isExcess) {
        //condtion if True
        setState(() {
          myfaviroutes.remove(meal);
          _onsnackbarMessage('This meal is no longer my favorite');
        });
      } else {
        //for false
        setState(() {
          myfaviroutes.add(meal);
          _onsnackbarMessage('Marked as a favorite.');
        });
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
    Widget currentscreen = Categories(
      onfiltered: avilablemeals,
      onchoosedasfav: _onselectedfaviroutes,
    );

    void changescreen(int index) {
      setState(() {
        _currentpageindex = index;
      });
    }

    if (_currentpageindex == 1) {
      currentscreen =
          MealsScreen(onchoosedfav: _onselectedfaviroutes, meals: myfaviroutes);
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
