class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Enum cost;
  final Enum complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isLactoseFree;

  Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.cost,
      required this.complexity,
      required this.imageUrl,
      required this.duration,
      required this.ingredients,
      required this.steps,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan});
}
