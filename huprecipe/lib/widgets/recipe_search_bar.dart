import 'package:flutter/material.dart';

class RecipeSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RecipeSearchBar({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Rechercher une recette...',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
