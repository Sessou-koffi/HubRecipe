import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/recipe.dart';
import '../widgets/recipe_store_scope.dart';

class RecipeDetailScreen extends StatelessWidget {
  final String recipeId;

  const RecipeDetailScreen({
    super.key,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    final store = RecipeStoreScope.of(context);
    final recipe = store.findById(recipeId);

    if (recipe == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Recette'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
              ),
              const SizedBox(height: 16),
              const Text('Recette introuvable'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Text('Retour à l’accueil'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        actions: [
          IconButton(
            onPressed: () {
              store.toggleFavorite(recipe.id);
            },
            tooltip: recipe.isFavorite
                ? 'Retirer des favoris'
                : 'Ajouter aux favoris',
            icon: Icon(
              recipe.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 600;

          if (isTablet) {
            return _TabletDetailLayout(recipe: recipe);
          }

          return _MobileDetailLayout(recipe: recipe);
        },
      ),
    );
  }
}

class _MobileDetailLayout extends StatelessWidget {
  final Recipe recipe;

  const _MobileDetailLayout({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RecipeImage(recipe: recipe),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _RecipeInformation(recipe: recipe),
          ),
        ],
      ),
    );
  }
}

class _TabletDetailLayout extends StatelessWidget {
  final Recipe recipe;

  const _TabletDetailLayout({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: AspectRatio(
              aspectRatio: 0.9,
              child: _RecipeImage(recipe: recipe),
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            flex: 5,
            child: _RecipeInformation(recipe: recipe),
          ),
        ],
      ),
    );
  }
}

class _RecipeImage extends StatelessWidget {
  final Recipe recipe;

  const _RecipeImage({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        recipe.imageUrl,
        width: double.infinity,
        height: 320,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 320,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: const Center(
              child: Icon(
                Icons.restaurant,
                size: 72,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RecipeInformation extends StatelessWidget {
  final Recipe recipe;

  const _RecipeInformation({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Chip(
              avatar: const Icon(
                Icons.category,
                size: 18,
              ),
              label: Text(recipe.category),
            ),
            Chip(
              avatar: const Icon(
                Icons.schedule,
                size: 18,
              ),
              label: Text('${recipe.preparationTime} min'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          recipe.name,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          recipe.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 28),
        Text(
          'Ingrédients',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        ...recipe.ingredients.map(
          (ingredient) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(ingredient),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
        Text(
          'Préparation',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        ...recipe.instructions.asMap().entries.map(
          (entry) {
            final index = entry.key;
            final instruction = entry.value;

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    child: Text('${index + 1}'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(instruction),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}