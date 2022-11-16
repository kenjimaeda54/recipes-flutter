import 'package:flutter/material.dart';
import 'package:recipes/components/singleCategory/SingleCategory.dart';
import 'package:recipes/data/categoriesMock.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Vamos cozinhar?",
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //maximo do eixo
          mainAxisSpacing: 20, // espaco entre lees
          childAspectRatio: 3 / 2, //1 /2 => imagem ficara 1 por 2 de aultra
          crossAxisSpacing: 20,
        ),
        children: categotegoriesMock.map((it) => SingleCategory(it)).toList(),
      ),
    );
  }
}
