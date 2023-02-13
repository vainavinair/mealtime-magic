// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:convert';

import 'package:http/http.dart';
import 'package:mealtime_magic/home_page.dart';
import 'package:mealtime_magic/recipe_view.dart';
import 'package:mealtime_magic/search_bar.dart';

import './models/recipe.dart';
import 'package:flutter/material.dart';

class ShowRecipe extends StatefulWidget {
  late String controller;

  ShowRecipe(this.controller);

  @override
  State<ShowRecipe> createState() => _ShowRecipeState();
}

class _ShowRecipeState extends State<ShowRecipe> {
  _search(String query) async {
    String url =
        'https://api.edamam.com/api/recipes/v2?type=public&q=$query&app_id=ed8282b8&app_key=8a4d8c94b108fd3185d0d43e332d4768';
    var response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    clearList();

    data['hits'].forEach((element) {
      Recipe recipe = Recipe();
      recipe = Recipe.fromMap(element["recipe"]);
      addNew(recipe);
    });
  }

  List<Recipe> recipeList = <Recipe>[];
  void clearList() {
    setState(() {
      recipeList.clear();
    });
  }

  void addNew(Recipe recipe) {
    setState(() {
      recipeList.add(recipe);
    });
  }

  @override
  void initState() {
    super.initState();
    _search(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => HomePage())));
          },
        ),
        title: SearchBar(),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: recipeList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RecipeView(recipeList[index].url)));
                },
                child: Card(
                  margin: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        recipeList[index].image,
                        fit: BoxFit.cover,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(recipeList[index].label),
                            Text(recipeList[index].cuisineType),
                            Text(recipeList[index].totalTime.toString())
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
