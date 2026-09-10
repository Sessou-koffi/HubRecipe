import 'package:flutter/material.dart';

import '../data/recipe_data.dart';
import '../models/recipe.dart';
import '../widgets/category_filter.dart';
import '../widgets/recipe_card.dart';
import '../widgets/recipe_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'Toutes';

  List<String> get _categories {
    final categories = recipes.map((recipe) => recipe.category).toSet().toList();

    return ['Toutes', ...categories];
  }

  List<Recipe> get _filteredRecipes {
    return recipes.where((recipe) {
      final matchesSearch = recipe.name.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );

      final matchesCategory = _selectedCategory == 'Toutes' ||
          recipe.category == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bonjour 👋',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Découvrez de délicieuses recettes',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  RecipeSearchBar(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Catégories',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  CategoryFilter(
                    categories: _categories,
                    selectedCategory: _selectedCategory,
                    onCategorySelected: (category) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Recettes',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.crossAxisExtent;
                final crossAxisCount = width >= 900 ? 3 : width >= 600 ? 2 : 1;

                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final recipe = _filteredRecipes[index];

                      return RecipeCard(
                        recipe: recipe,
                      );
                    },
                    childCount: _filteredRecipes.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: width < 600 ? 1.55 : 0.9,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}