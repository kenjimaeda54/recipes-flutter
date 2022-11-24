import 'package:flutter/material.dart';
import 'package:recipes/model/Meal.dart';

class MealDetails extends StatelessWidget {
  void Function(Meal meal) toggleFavorites;
  bool Function(Meal meal) isFavoritesRecipes;

  MealDetails(
      {super.key,
      required this.isFavoritesRecipes,
      required this.toggleFavorites});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    Widget createSection(String title) {
      return Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
          ));
    }

    Widget createList(Widget children) {
      return Container(
          height: 300,
          width: 300,
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          //nao pode usar decoration com color,
          //caso for usar propriedade decoration a cor interna fica por conta
          //dessa propriedade
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1)),
          child: children);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
            //implementar auqi
            createSection("Ingredientes"),
            createList(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (buildCxt, index) => Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                    child: Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(meal.ingredients[index])))),
              ),
            ),
            createSection("Passos"),
            createList(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(meal.steps[index],
                        style: const TextStyle(color: Colors.grey)),
                  ),
                  //divider cria uma linha
                  const Divider()
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        //com pop conseguimos mandar um argumento para tela anterior
        // () => Navigator.of(context).pop(meal.title)
        onPressed: () => toggleFavorites(meal),
        child: Icon(
          isFavoritesRecipes(meal) ? Icons.star : Icons.star_border,
          size: 26,
        ),
      ),
    );
  }
}
