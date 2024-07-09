import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/datas/dummy_datas.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
