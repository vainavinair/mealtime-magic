import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'models/recipe.dart';

class ApiHandler {
  static Future<List<Recipe>> search(String query) async {
    List<Recipe> recipeList = <Recipe>[];
    try {
      String url =
          'https://api.edamam.com/api/recipes/v2?type=public&q=${query}&app_id=ed8282b8&app_key=8a4d8c94b108fd3185d0d43e332d4768';
      var response = await get(Uri.parse(url));
      Map data = jsonDecode(response.body);
      if (data['hits'] != null) {
        for (var element in data['hits']) {
          Recipe recipe = Recipe();
          recipe = Recipe.fromMap(element["recipe"]);
          recipeList.add(recipe);
        }
      }
      return recipeList;
    } catch (e) {
      log(e.toString());
      return recipeList;
    }

    // if (data['hits'] != null) {
    //   data['hits'].forEach((element) {
    //     Recipe recipe = Recipe();
    //     recipe = Recipe.fromMap(element["recipe"]);
    //     recipeList.add(recipe);
    //   });
    // }
  }

  static Future<List<Recipe>> random(url) async {
    // String url =
    //     'https://api.edamam.com/api/recipes/v2?type=public&app_id=ed8282b8&app_key=%208a4d8c94b108fd3185d0d43e332d4768%09&imageSize=REGULAR&random=true';
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

  static Future<List<Recipe>> cuisineSearch(url) async {
    // String url =
    //     'https://api.edamam.com/api/recipes/v2?type=public&app_id=ed8282b8&app_key=%208a4d8c94b108fd3185d0d43e332d4768&cuisineType=${cuisine}';
    var response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    List<Recipe> recipeList = <Recipe>[];

    data['hits'].forEach((element) {
      Recipe recipe = Recipe();
      recipe = Recipe.fromMap(element["recipe"]);
      recipeList.add(recipe);
    });
    return recipeList;
  }
}
