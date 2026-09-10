import 'package:go_router/go_router.dart';

import '../screens/add_recipe_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';
import '../screens/recipe_detail_screen.dart';
import '../screens/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/recipe/:id',
      builder: (context, state) {
        final recipeId = state.pathParameters['id']!;

        return RecipeDetailScreen(
          recipeId: recipeId,
        );
      },
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) {
        return const FavoritesScreen();
      },
    ),
    GoRoute(
      path: '/add-recipe',
      builder: (context, state) {
        return const AddRecipeScreen();
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) {
        return const SettingsScreen();
      },
    ),
  ],
);