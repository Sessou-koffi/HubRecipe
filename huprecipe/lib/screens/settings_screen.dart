import 'package:flutter/material.dart';

//import '../theme/theme_controller.dart';
import '../widgets/theme_controller_scope.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  String _themeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'Système';
      case ThemeMode.light:
        return 'Clair';
      case ThemeMode.dark:
        return 'Sombre';
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ThemeControllerScope.of(context);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
        children: [
          Text(
            'Paramètres',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Personnalisez votre expérience RecipeHub.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.palette_outlined),
                      SizedBox(width: 12),
                      Text(
                        'Apparence',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choisissez le thème de l’application.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),

                  DropdownButtonFormField<ThemeMode>(
                    initialValue: controller.themeMode,
                    decoration: const InputDecoration(
                      labelText: 'Thème',
                      prefixIcon: Icon(Icons.brightness_6_outlined),
                    ),
                    items: ThemeMode.values.map((mode) {
                      return DropdownMenuItem<ThemeMode>(
                        value: mode,
                        child: Text(_themeLabel(mode)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        controller.setThemeMode(value);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Card(
            child: const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('RecipeHub'),
              subtitle: Text(
                'Application Flutter de gestion de recettes',
              ),
            ),
          ),
        ],
      ),
    );
  }
}