// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:ui';

import 'package:mealtime_magic/home_page.dart';
import 'package:mealtime_magic/recipe_view.dart';
import 'package:mealtime_magic/search_bar.dart';

import './models/recipe.dart';
import 'package:flutter/material.dart';

import 'api_handler.dart';

class ShowRecipe extends StatefulWidget {
  late String controller;

  ShowRecipe(this.controller);

  @override
  State<ShowRecipe> createState() => _ShowRecipeState();
}

class _ShowRecipeState extends State<ShowRecipe> {
  List<Recipe> recipeList = <Recipe>[];

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  _loadRecipes() async {
    List<Recipe> recipes = await ApiHandler.search(widget.controller);
    setState(() {
      recipeList = recipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomePage())));
            },
          ),
          title: SearchBar(),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
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
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            recipeList[index].image,
                            fit: BoxFit.cover,
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                          ),
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
        ));
  }
}
