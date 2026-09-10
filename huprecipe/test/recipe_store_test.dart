import 'package:flutter_test/flutter_test.dart';
import 'package:huprecipe/services/recipe_store.dart';

void main() {
  late RecipeStore store;

  setUp(() {
    store = RecipeStore();
  });

  tearDown(() {
    store.dispose();
  });

  test('should load recipes', () {
    expect(store.recipes.isNotEmpty, true);
  });

  test('should toggle favorite', () {
    final recipe = store.recipes.first;

    expect(recipe.isFavorite, false);

    store.toggleFavorite(recipe.id);

    expect(recipe.isFavorite, true);

    store.toggleFavorite(recipe.id);

    expect(recipe.isFavorite, false);
  });

  test('should find recipe by id', () {
    final recipe = store.recipes.first;

    final result = store.findById(recipe.id);

    expect(result, isNotNull);
    expect(result!.id, recipe.id);
  });

  test('should return only favorite recipes', () {
    final recipe = store.recipes.first;

    store.toggleFavorite(recipe.id);

    expect(store.favoriteRecipes.length, 1);
    expect(store.favoriteRecipes.first.id, recipe.id);
  });

  test('should add a recipe', () {
    final initialCount = store.recipes.length;

    store.addRecipe(
      name: 'Nouvelle recette',
      description: 'Une délicieuse recette',
      category: 'Dessert',
      preparationTime: 30,
      ingredients: [
        'Farine',
        'Sucre',
      ],
      instructions: [
        'Mélanger les ingrédients',
        'Cuire',
      ],
    );

    expect(store.recipes.length, initialCount + 1);
    expect(
      store.recipes.last.name,
      'Nouvelle recette',
    );
  });
}