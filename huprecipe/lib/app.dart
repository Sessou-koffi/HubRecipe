import 'package:flutter/material.dart';

import 'routes/app_router.dart';
import 'services/recipe_store.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';
import 'widgets/recipe_store_scope.dart';
import 'widgets/theme_controller_scope.dart';

class RecipeHubApp extends StatefulWidget {
  const RecipeHubApp({super.key});

  @override
  State<RecipeHubApp> createState() => _RecipeHubAppState();
}

class _RecipeHubAppState extends State<RecipeHubApp> {
  final ThemeController _themeController = ThemeController();
  final RecipeStore _recipeStore = RecipeStore();

  @override
  void dispose() {
    _themeController.dispose();
    _recipeStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RecipeStoreScope(
      store: _recipeStore,
      child: ThemeControllerScope(
        controller: _themeController,
        child: AnimatedBuilder(
          animation: _themeController,
          builder: (context, child) {
            return MaterialApp.router(
              title: 'RecipeHub',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: _themeController.themeMode,
              routerConfig: appRouter,
            );
          },
        ),
      ),
    );
  }
}