import 'package:flutter/foundation.dart';

import '../data/recipe_data.dart' as recipe_data;
import '../models/recipe.dart';

class RecipeStore extends ChangeNotifier {
  final List<Recipe> _recipes =
      List<Recipe>.from(recipe_data.recipes);

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  List<Recipe> get favoriteRecipes {
    return _recipes
        .where((recipe) => recipe.isFavorite)
        .toList();
  }

  Recipe? findById(String id) {
    for (final recipe in _recipes) {
      if (recipe.id == id) {
        return recipe;
      }
    }

    return null;
  }

  void toggleFavorite(String id) {
    final recipe = findById(id);

    if (recipe == null) {
      return;
    }

    recipe.isFavorite = !recipe.isFavorite;

    notifyListeners();
  }

  void addRecipe({
    required String name,
    required String description,
    required String category,
    required int preparationTime,
    required List<String> ingredients,
    required List<String> instructions,
  }) {
    final recipe = Recipe(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      imageUrl:
          'https://images.unsplash.com/photo-1547592180-85f173990554',
      category: category,
      preparationTime: preparationTime,
      ingredients: ingredients,
      instructions: instructions,
    );

    _recipes.add(recipe);

    notifyListeners();
  }
}