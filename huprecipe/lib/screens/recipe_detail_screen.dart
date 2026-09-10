import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/recipe_data.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final String recipeId;

  const RecipeDetailScreen({
    super.key,
    required this.recipeId,
  });

  Recipe? get recipe {
    try {
      return recipes.firstWhere(
        (item) => item.id == recipeId,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentRecipe = recipe;

    if (currentRecipe == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Recette introuvable'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                'Cette recette n’existe pas.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.go('/'),
                child: const Text('Retour à l’accueil'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentRecipe.name),
        actions: [
          IconButton(
            onPressed: () {
              // Les favoris seront connectés plus tard.
            },
            icon: Icon(
              currentRecipe.isFavorite
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
            return _TabletDetailLayout(
              recipe: currentRecipe,
            );
          }

          return _MobileDetailLayout(
            recipe: currentRecipe,
          );
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
          _RecipeImage(
            recipe: recipe,
            height: 280,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _RecipeInformation(
              recipe: recipe,
            ),
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
            child: _RecipeImage(
              recipe: recipe,
              height: 500,
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            flex: 5,
            child: _RecipeInformation(
              recipe: recipe,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecipeImage extends StatelessWidget {
  final Recipe recipe;
  final double height;

  const _RecipeImage({
    required this.recipe,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Image.network(
        recipe.imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(
              Icons.restaurant,
              size: 64,
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
        Text(
          recipe.name,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Chip(
              avatar: const Icon(
                Icons.category_outlined,
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
          recipe.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 32),
        Text(
          'Ingrédients',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        ...recipe.ingredients.map(
          (ingredient) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(ingredient),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
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