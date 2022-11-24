import 'package:flutter/material.dart';
import 'package:recipes/components/singleCardMeal/SingleCardMeal.dart';
import 'package:recipes/screen/mealDetails/mealDetails.dart';

import '../../model/Meal.dart';

class FavoriteRecipes extends StatelessWidget {
  List<Meal> meals;

  FavoriteRecipes(this.meals, {super.key});

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? const Text("Não possui comidas favoritas")
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) => SingleCardMeal(meals[index]));
  }
}
