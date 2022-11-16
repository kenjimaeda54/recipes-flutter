import 'package:flutter/material.dart';
import 'package:recipes/model/Category.dart';
import 'package:recipes/utils/appRoutes.dart';

class SingleCategory extends StatelessWidget {
  final Category category;

  const SingleCategory(this.category, {super.key});

  void _navigateRoute(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.categoryMeals, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //se nao colocar esse border radius ficara ao clicar um quadrado ao invez redondo
      borderRadius: BorderRadius.circular(5),
      onTap: () => _navigateRoute(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [category.color.withOpacity(0.5), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(category.title),
      ),
    );
  }
}
