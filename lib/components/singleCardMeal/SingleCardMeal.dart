import 'package:flutter/material.dart';
import 'package:recipes/model/Meal.dart';

class SingleCardMeal extends StatelessWidget {
  final Meal meal;

  const SingleCardMeal(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
