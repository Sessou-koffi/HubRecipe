import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/recipe_store_scope.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _timeController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _timeController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ce champ est obligatoire';
    }

    return null;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final preparationTime = int.tryParse(
      _timeController.text.trim(),
    );

    if (preparationTime == null || preparationTime <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Le temps doit être un nombre valide.'),
        ),
      );
      return;
    }

    final ingredients = _ingredientsController.text
        .split('\n')
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toList();

    final instructions = _instructionsController.text
        .split('\n')
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toList();

    final store = RecipeStoreScope.of(context);

    store.addRecipe(
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      category: _categoryController.text.trim(),
      preparationTime: preparationTime,
      ingredients: ingredients,
      instructions: instructions,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Recette ajoutée avec succès !'),
      ),
    );

    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une recette'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Nouvelle recette',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _nameController,
                    validator: _requiredValidator,
                    decoration: const InputDecoration(
                      labelText: 'Nom de la recette',
                      prefixIcon: Icon(Icons.restaurant_menu),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    validator: _requiredValidator,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      prefixIcon: Icon(Icons.description),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _categoryController,
                    validator: _requiredValidator,
                    decoration: const InputDecoration(
                      labelText: 'Catégorie',
                      prefixIcon: Icon(Icons.category),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _timeController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Ce champ est obligatoire';
                      }

                      final time = int.tryParse(value);

                      if (time == null || time <= 0) {
                        return 'Entrez un nombre valide';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Temps de préparation (minutes)',
                      prefixIcon: Icon(Icons.schedule),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _ingredientsController,
                    validator: _requiredValidator,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Ingrédients',
                      hintText: 'Un ingrédient par ligne',
                      prefixIcon: Icon(Icons.shopping_basket),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _instructionsController,
                    validator: _requiredValidator,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      labelText: 'Instructions',
                      hintText: 'Une étape par ligne',
                      prefixIcon: Icon(Icons.menu_book),
                    ),
                  ),
                  const SizedBox(height: 28),
                  FilledButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.add),
                    label: const Text('Ajouter la recette'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}