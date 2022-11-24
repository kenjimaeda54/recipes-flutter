import 'package:flutter/material.dart';
import 'package:recipes/data/mealsMock.dart';
import 'package:recipes/model/Settings.dart';
import 'package:recipes/screen/Category/CategoryScreen.dart';
import 'package:recipes/screen/categoryMeals/CategoryMeals.dart';
import 'package:recipes/screen/mealDetails/mealDetails.dart';
import 'package:recipes/screen/settings/Settings.dart';
import 'package:recipes/screen/tabs/TabasNavigation.dart';
import 'package:recipes/utils/appRoutes.dart';

import 'model/Meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  SettingsModel settingsModel = SettingsModel();
  List<Meal> recipesFavorite = [];
  List<Meal> mealsFilter = mealsMock;

  void _filterMeals(SettingsModel settingsModel) {
    setState(() =>
    {
      this.settingsModel = settingsModel,
      //lógica para filtrar comidas pelo tipo
      mealsFilter = mealsMock.where((it) {
        //estou comparando se o valor e verdadeiro e a comida possue esse valor
        bool isLactoseFree =
            settingsModel.isLactoseFree && !it.isLactoseFree;
        bool isGlutenFree = settingsModel.isGlutenFree && !it.isGlutenFree;
        bool isVegan = settingsModel.isVegan && !it.isVegan;

        return !isLactoseFree && !isGlutenFree && !isVegan;
      }).toList()
    });
  }

  bool _isFavorite(Meal meal) {
    return recipesFavorite.contains(meal);
  }

  void _toogleRecipesFavorite(Meal meal) {
    setState(() {
      recipesFavorite.contains(meal)
          ? recipesFavorite.remove(meal)
          : recipesFavorite.add(meal);
      _isFavorite(meal);
    });
  }

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
        AppRoutes.home: (_) => TabsNavigation(recipesFavorite),
        AppRoutes.categoryMeals: (_) => CategoryMeals(mealsFilter),
        AppRoutes.mealDetails: (_) =>
            MealDetails(
                isFavoritesRecipes: _isFavorite,
                toggleFavorites: _toogleRecipesFavorite),
        AppRoutes.settings: (_) =>
            Settings(filterMeals: _filterMeals, settings: settingsModel),
      },
    );
  }
}
