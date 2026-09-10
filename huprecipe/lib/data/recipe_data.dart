import '../models/recipe.dart';

final List<Recipe> recipes = [
  Recipe(
    id: '1',
    name: 'Pizza Margherita',
    description:
        'Une pizza italienne classique avec tomate, mozzarella et basilic.',
    imageUrl:
        'https://images.unsplash.com/photo-1574071318508-1cdbab80d002',
    category: 'Déjeuner',
    preparationTime: 30,
    ingredients: [
      'Pâte à pizza',
      'Tomates',
      'Mozzarella',
      'Basilic',
      'Huile d’olive',
    ],
    instructions: [
      'Préparer la pâte à pizza.',
      'Étaler la pâte.',
      'Ajouter la sauce tomate.',
      'Ajouter la mozzarella.',
      'Cuire au four pendant 15 minutes.',
      'Ajouter le basilic avant de servir.',
    ],
  ),
  Recipe(
    id: '2',
    name: 'Pâtes Carbonara',
    description:
        'Des pâtes crémeuses accompagnées de parmesan et de poitrine fumée.',
    imageUrl:
        'https://images.unsplash.com/photo-1473093295043-cdd812d0e601',
    category: 'Déjeuner',
    preparationTime: 25,
    ingredients: [
      'Spaghetti',
      'Œufs',
      'Parmesan',
      'Poitrine fumée',
      'Poivre noir',
    ],
    instructions: [
      'Faire cuire les pâtes.',
      'Faire revenir la poitrine fumée.',
      'Mélanger les œufs avec le parmesan.',
      'Ajouter les pâtes à la préparation.',
      'Mélanger rapidement hors du feu.',
      'Ajouter du poivre et servir.',
    ],
  ),
  Recipe(
    id: '3',
    name: 'Salade César',
    description:
        'Une salade fraîche avec poulet grillé, laitue, parmesan et croûtons.',
    imageUrl:
        'https://images.unsplash.com/photo-1546793665-c74683f339c1',
    category: 'Déjeuner',
    preparationTime: 20,
    ingredients: [
      'Laitue',
      'Poulet',
      'Parmesan',
      'Croûtons',
      'Sauce César',
    ],
    instructions: [
      'Laver et couper la laitue.',
      'Griller le poulet.',
      'Couper le poulet en morceaux.',
      'Ajouter les croûtons et le parmesan.',
      'Ajouter la sauce César.',
      'Mélanger et servir.',
    ],
  ),
  Recipe(
    id: '4',
    name: 'Pancakes',
    description:
        'De délicieux pancakes moelleux parfaits pour le petit-déjeuner.',
    imageUrl:
        'https://images.unsplash.com/photo-1528207776546-365bb710ee93',
    category: 'Petit-déjeuner',
    preparationTime: 15,
    ingredients: [
      'Farine',
      'Œufs',
      'Lait',
      'Sucre',
      'Levure',
    ],
    instructions: [
      'Mélanger la farine et la levure.',
      'Ajouter les œufs et le lait.',
      'Ajouter le sucre.',
      'Mélanger jusqu’à obtenir une pâte homogène.',
      'Cuire les pancakes dans une poêle.',
      'Servir avec les accompagnements de votre choix.',
    ],
  ),
  Recipe(
    id: '5',
    name: 'Gâteau au chocolat',
    description:
        'Un gâteau au chocolat fondant et gourmand pour terminer un repas.',
    imageUrl:
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
    category: 'Dessert',
    preparationTime: 45,
    ingredients: [
      'Chocolat noir',
      'Farine',
      'Œufs',
      'Sucre',
      'Beurre',
    ],
    instructions: [
      'Faire fondre le chocolat et le beurre.',
      'Mélanger les œufs avec le sucre.',
      'Ajouter le chocolat fondu.',
      'Ajouter la farine.',
      'Verser dans un moule.',
      'Cuire pendant environ 30 minutes.',
    ],
  ),
];