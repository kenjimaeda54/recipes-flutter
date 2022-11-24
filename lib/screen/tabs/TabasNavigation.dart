import 'package:flutter/material.dart';
import 'package:recipes/components/drawer/DrawerNavigation.dart';
import 'package:recipes/screen/Category/CategoryScreen.dart';
import 'package:recipes/screen/favorite_recipes/FavoriteRecipes.dart';

import '../../model/Meal.dart';

class TabsNavigation extends StatefulWidget {
  late List<Meal> meals;

  TabsNavigation(this.meals, {super.key});

  @override
  State<TabsNavigation> createState() => _TabsNavigationState();
}

class _TabsNavigationState extends State<TabsNavigation> {
  int tabSelected = 0;
  late List<Map<String, Object>> screensNavigation;

  @override
  //funções soltas no codigo não dão acesso ao widget,print...
  void initState() {
    // TODO: implement initState
    super.initState();
    screensNavigation = [
      {"title": "Lista de categorias", "screen": const CategoryScreen()},
      {"title": "Lista de favoritos", "screen": FavoriteRecipes(widget.meals)},
    ];
  }

  int handleTabSelected(int index) {
    setState(() {
      tabSelected = index;
    });
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screensNavigation[tabSelected]["title"] as String),
      ),
      body: screensNavigation[tabSelected]["screen"] as Widget,
      drawer: const DrawerNavigation(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(206, 122, 122, 1.0),
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        onTap: handleTabSelected,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categorias"),
          BottomNavigationBarItem(icon: Icon(Icons.start), label: "Favoritas"),
        ],
      ),
    );
  }
}
