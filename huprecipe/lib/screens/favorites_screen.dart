import 'package:flutter/material.dart';

import '../widgets/recipe_card.dart';
import '../widgets/recipe_store_scope.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = RecipeStoreScope.of(context);
    final favorites = store.favoriteRecipes;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mes favoris',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              '${favorites.length} recette${favorites.length > 1 ? 's' : ''} favorite${favorites.length > 1 ? 's' : ''}',
            ),
            const SizedBox(height: 24),
            Expanded(
              child: favorites.isEmpty
                  ? const _EmptyFavorites()
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        final width = constraints.maxWidth;

                        final crossAxisCount = width >= 900
                            ? 3
                            : width >= 600
                                ? 2
                                : 1;

                        return GridView.builder(
                          itemCount: favorites.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: width < 600 ? 1.55 : 0.9,
                          ),
                          itemBuilder: (context, index) {
                            final recipe = favorites[index];

                            return RecipeCard(
                              recipe: recipe,
                              onFavoritePressed: () {
                                store.toggleFavorite(recipe.id);
                              },
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 72,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Aucun favori',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Ajoutez vos recettes préférées avec le cœur ❤️',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}