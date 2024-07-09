import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/mealsdummy.dart';
import 'package:flutter/material.dart';

class FaviroutesProvideNotifier extends StateNotifier<List<Meal>> {
  FaviroutesProvideNotifier() : super([]);
  void toggleforfaviroute(Meal meal) {
    final isfavchecked = state.contains(meal);

    if (isfavchecked) {
      state = state.where((isthere) => isthere.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
  
}

final faviroutesprovider =
    StateNotifierProvider<FaviroutesProvideNotifier, List<Meal>>((ref) {
  return FaviroutesProvideNotifier();
});
