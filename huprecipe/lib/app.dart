import 'package:flutter/material.dart';

import 'routes/app_router.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

class RecipeHubApp extends StatefulWidget {
  const RecipeHubApp({super.key});

  @override
  State<RecipeHubApp> createState() => _RecipeHubAppState();
}

class _RecipeHubAppState extends State<RecipeHubApp> {
  final ThemeController _themeController = ThemeController();

  @override
  void dispose() {
    _themeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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
    );
  }
}