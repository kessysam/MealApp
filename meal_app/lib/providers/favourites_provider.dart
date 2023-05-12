import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    final mealisFavourite = state.contains(meal);

    if (mealisFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }

    state = [...state, meal];
    return true;
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
  (ref) {
    return FavouriteMealsNotifier();
  },
);
