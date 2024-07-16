import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeListScreen(),
    );
  }
}

class Recipe {
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
  });
}

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final List<Recipe> recipes = [
    Recipe(
      title: 'Lemon Rice',
      imageUrl:
          'https://th.bing.com/th?id=OSK.c4b68914b6d0a12a3819252900b2733f&w=228&h=228&rs=2&qlt=80&o=6&cdv=1&dpr=1.3&pid=16.1',
      ingredients: [
        'Cooked Rice',
        'Lemon',
        'Peanut',
        'Turmeric',
        'Spices',
        'Curry leaves',
        'Salt'
      ],
      instructions: [
        'Take a cup of cooked rice',
        'Fry peanuts and a few spices',
        'Squeeze the lemons',
        'Combine all and mix well'
      ],
    ),
    Recipe(
      title: 'Chapati',
      imageUrl:
          'https://th.bing.com/th/id/OIP.hY_hNVhdUpOSzzinX_A9BQHaHa?w=193&h=193&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      ingredients: ['Wheat Flour', 'Maida', 'Salt', 'Ghee'],
      instructions: [
        'Take 2 cups of wheat flour and 1/4 cup maida',
        'Add 1 cup of water and 1/2 teaspoon ghee(optional)',
        'Mix it well and the dough is prepared',
        'Leave the dough for 30 minutes',
        'Roll the dough into small balls ',
        'Make it into single layer of chapati',
        'Roast it and chapati is ready'
      ],
    ),
    Recipe(
      title: 'Maggi Noodles',
      imageUrl:
          'https://th.bing.com/th/id/OIP.T4wA93v7v3vn43_npfNHwQHaDw?w=312&h=200&c=7&o=5&dpr=1.3&pid=1.7',
      ingredients: ['Maggi', 'Green peas', 'Carrot', 'Masala'],
      instructions: [
        'Boil the noodles until they split up',
        'Boil green peas and pieces of carrot separately',
        'Now add the boiled vegetables to the noodles',
        'Add some masala and turn off after 2 minutes',
        'Noodles is ready'
      ],
    ),
    // Add more recipes here
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = recipes.where((recipe) {
      return recipe.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(filteredRecipes[index].imageUrl),
                  title: Text(filteredRecipes[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailScreen(recipe: filteredRecipes[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe.imageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ingredients',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            for (var ingredient in recipe.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(ingredient),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Instructions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            for (var instruction in recipe.instructions)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(instruction),
              ),
          ],
        ),
      ),
    );
  }
}
