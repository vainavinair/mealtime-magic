import 'dart:convert';

import 'package:http/http.dart';

import 'models/recipe.dart';

class ApiHandler {
  static Future<List<Recipe>> recipesByquery(String query) async {
    String url =
        'https://api.edamam.com/api/recipes/v2?type=public&q=$query&app_id=ed8282b8&app_key=8a4d8c94b108fd3185d0d43e332d4768';
    var response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    List<Recipe> recipeList = <Recipe>[];

    if (data['hits'] != null) {
      for (var element in data['hits']) {
        Recipe recipe = Recipe();
        recipe = Recipe.fromMap(element["recipe"]);
        recipeList.add(recipe);
      }
    }

    return recipeList;
  }

  static Future<List<Recipe>> recipesByUrl(url) async {
    var response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    List<Recipe> recipeList = <Recipe>[];

    if (data['hits'] != null) {
      for (var element in data['hits']) {
        Recipe recipe = Recipe();
        recipe = Recipe.fromMap(element["recipe"]);
        recipeList.add(recipe);
      }
    }
    return recipeList;
  }
}
