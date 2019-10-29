import 'dart:async';

import 'recipe_data.dart';

class MockRecipeRepository implements RecipeRepository {
  @override
  Future<List<Recipe>> fetch() {
    return new Future.value(staticRecipes);
  }

  @override
  Future<Recipe> get(int id) {
    // TODO: implement get
    return null;
  }
}

var staticRecipes = <Recipe>[
  Recipe(recipeID: 0001, name: "Sopa de caracol", category: "Sopas"),
  Recipe(recipeID: 0002, name: "Arroz con pollo", category: "Arroz"),
  Recipe(recipeID: 0003, name: "Tarta de queso", category: "Postres")
];
