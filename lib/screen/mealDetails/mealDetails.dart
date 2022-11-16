import 'package:flutter/material.dart';
import 'package:recipes/model/Meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute
        .of(context)
        ?.settings
        .arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: const Text("ola mundo"),
    );
  }
}
