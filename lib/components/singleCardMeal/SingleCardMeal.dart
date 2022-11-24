import 'package:flutter/material.dart';
import 'package:recipes/model/Meal.dart';
import 'package:recipes/utils/appRoutes.dart';

class SingleCardMeal extends StatelessWidget {
  final Meal meal;

  const SingleCardMeal(this.meal, {super.key});

  void _handleRoute(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.mealDetails, arguments: meal);
    //para pegar um argumento que foi enviado de outra tela sendo  esta como primeiro
    //seria pelo then
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleRoute(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  )),
              //positoined esta disponivel apenas dentro da stack
              //funcoina como o possition absolute e a stack realtive
              //entao posiciono de forma absoluta dentro da stack
              Positioned(
                right: 10,
                bottom: 20,
                child: SizedBox(
                  width: 250,
                  child: Card(
                    elevation: 5,
                    color: Colors.black45,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.schedule),
                      Text(" ${meal.duration} min")
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.work),
                      Text(meal.shouldReturnComplexity)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.attach_money),
                      Text(meal.shouldReturnExpensive)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
