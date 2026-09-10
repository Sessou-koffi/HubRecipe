import 'package:flutter/material.dart';

import '../services/recipe_store.dart';

class RecipeStoreScope extends InheritedNotifier<RecipeStore> {
  const RecipeStoreScope({
    super.key,
    required RecipeStore store,
    required super.child,
  }) : super(
          notifier: store,
        );

  static RecipeStore of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<RecipeStoreScope>();

    assert(
      scope != null,
      'RecipeStoreScope not found in widget tree.',
    );

    return scope!.notifier!;
  }
}