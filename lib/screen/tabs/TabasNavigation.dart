import 'package:flutter/material.dart';
import 'package:recipes/components/drawer/DrawerNavigation.dart';
import 'package:recipes/screen/Category/CategoryScreen.dart';
import 'package:recipes/screen/favorite_recipes/FavoriteRecipes.dart';

class TabsNavigation extends StatefulWidget {
  const TabsNavigation({Key? key}) : super(key: key);

  @override
  State<TabsNavigation> createState() => _TabsNavigationState();
}

class _TabsNavigationState extends State<TabsNavigation> {
  int tabSelected = 0;

  List<Map<String, Object>> screensNavigation = [
    {"title": "Lista de categorias", "screen": const CategoryScreen()},
    {"title": "Lista de favoritos", "screen": const FavoriteRecipes()},
  ];

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
