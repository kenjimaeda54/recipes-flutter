import 'package:flutter/material.dart';
import 'package:recipes/screen/Category/CategoryScreen.dart';
import 'package:recipes/screen/categoryMeals/CategoryMeals.dart';
import 'package:recipes/screen/mealDetails/mealDetails.dart';
import 'package:recipes/utils/appRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily: 'Raleway',
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(206, 122, 122, 1.0),
          ),
          canvasColor: const Color.fromRGBO(254, 254, 229, 1),
          textTheme: const TextTheme(
              titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed-Regular',
                  color: Colors.white)),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber)),
      //concentro as rotas aqui
      routes: {
        //rotas inicial pode ser /
        AppRoutes.home: (_) => const CategoryScreen(),
        AppRoutes.categoryMeals: (_) => const CategoryMeals(),
        AppRoutes.mealDetails: (_) => const MealDetails()
      },
    );
  }
}
