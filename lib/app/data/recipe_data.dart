import 'dart:async';

class Recipe {
  final int recipeID;
  final String name;
  final String category;
  final String imageURL;
  List<String> ingredients;

  Recipe(
      {this.recipeID,
      this.name,
      this.category,
      this.imageURL,
      this.ingredients});

  Recipe.fromMap(Map<String, dynamic> map)
      : recipeID = int.tryParse(map['recipe_id']),
        name = "${map['title']}",
        category = "${map['publisher']}",
        imageURL = "${map['image_url']}" {
    if (map['ingredients'] != null) {
      ingredients = List<String>.from(map['ingredients']);
    }
  }
}

abstract class RecipeRepository {
  Future<List<Recipe>> fetch();
  Future<Recipe> get(int id);
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
