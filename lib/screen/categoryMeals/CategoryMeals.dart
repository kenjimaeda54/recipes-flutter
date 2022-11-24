import 'package:flutter/material.dart';
import 'package:recipes/components/singleCardMeal/SingleCardMeal.dart';
import 'package:recipes/data/mealsMock.dart';
import 'package:recipes/model/Category.dart';

import '../../model/Meal.dart';

class CategoryMeals extends StatefulWidget {
  late List<Meal> meals;

  CategoryMeals(this.meals, {super.key});

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  @override
  Widget build(BuildContext context) {
    //recebo os argumetnos das rotas por ModalRoute
    final arguments = ModalRoute.of(context)?.settings.arguments as Category;

    final listMeals = widget.meals.where((it) =>
        //se existir algo retornara true
        //contains e uma propriedade do array que tras verdadeiro ou faslo
        it.categories.contains(arguments.id)).toList();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            arguments.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: ListView.builder(
            itemCount: listMeals.length,
            itemBuilder: (_, index) {
              final it = listMeals[index];

              return SingleCardMeal(it);
            }));
  }
}
