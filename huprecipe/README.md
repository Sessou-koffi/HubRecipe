# 🍳 HupRecipe

HupRecipe est une application mobile de gestion et de découverte de recettes développée avec Flutter.

L'application permet de consulter des recettes, rechercher et filtrer des recettes, consulter leurs détails, gérer ses favoris et ajouter de nouvelles recettes.

## ✨ Fonctionnalités

- 🏠 Accueil avec liste des recettes
- 🔎 Recherche de recettes
- 🏷️ Filtrage par catégorie
- 📖 Consultation du détail d'une recette
- ❤️ Gestion des recettes favorites
- ➕ Ajout d'une nouvelle recette
- ✅ Validation des formulaires
- 🌞 Thème clair
- 🌙 Thème sombre
- ⚙️ Paramètres
- 📱 Interface responsive mobile et tablette
- 🧭 Navigation avec GoRouter

## 📱 Écrans

L'application contient plusieurs écrans :

1. Accueil
2. Détail d'une recette
3. Favoris
4. Ajouter une recette
5. Paramètres

## 🛠️ Technologies utilisées

- Flutter
- Dart
- Material 3
- GoRouter
- ChangeNotifier
- InheritedNotifier

## 📂 Architecture

```text
lib/
├── data/
│   └── recipe_data.dart
│
├── models/
│   └── recipe.dart
│
├── routes/
│   └── app_router.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── recipe_detail_screen.dart
│   ├── favorites_screen.dart
│   ├── add_recipe_screen.dart
│   └── settings_screen.dart
│
├── services/
│   └── recipe_store.dart
│
├── theme/
│   ├── app_theme.dart
│   └── theme_controller.dart
│
├── widgets/
│   ├── app_shell.dart
│   ├── category_filter.dart
│   ├── recipe_card.dart
│   ├── recipe_search_bar.dart
│   ├── recipe_store_scope.dart
│   └── theme_controller_scope.dart
│
├── app.dart
└── main.dart

🚀 Installation
Prérequis

Installer Flutter et vérifier l'environnement :

flutter doctor
Cloner le projet
git clone <URL_DU_REPOSITORY>

Entrer dans le projet :

cd huprecipe

Installer les dépendances :

flutter pub get

Lancer l'application :

flutter run
🧪 Tests

Analyser le projet :

flutter analyze

Lancer les tests :

flutter test
📱 Responsive Design

L'interface s'adapte automatiquement aux différentes tailles d'écran.

Sur mobile :

navigation inférieure avec NavigationBar
affichage des recettes en une colonne

Sur tablette :

navigation latérale avec NavigationRail
affichage des recettes en plusieurs colonnes
mise en page adaptée pour les détails d'une recette
🎯 Objectif du projet

Ce projet a été réalisé dans le cadre d'une formation Flutter afin de mettre en pratique :

la navigation multi-écrans ;
la création de widgets réutilisables ;
la gestion d'état ;
la validation des formulaires ;
le responsive design ;
les thèmes clair et sombre ;
la séparation entre les données et l'interface utilisateur.

## 📸 Captures d'écran

### Accueil

![Accueil](screenshots/home.png)

### Détail d'une recette

![Détail](screenshots/detail.png)

### Favoris

![Favoris](screenshots/favorites.png)

### Ajouter une recette

![Ajouter une recette](screenshots/add_recipe.png)

### Paramètres

![Paramètres](screenshots/settings.png)

👨‍💻 Auteur

Projet réalisé dans le cadre de la formation NextFlutter.