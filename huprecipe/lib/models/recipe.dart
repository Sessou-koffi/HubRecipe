class Recipe {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String category;
  final int preparationTime;
  final List<String> ingredients;
  final List<String> instructions;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.preparationTime,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });
}