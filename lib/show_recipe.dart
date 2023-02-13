// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

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
                        Positioned(
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 20,
                            width: 100,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Color(0xffFFEDE9),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.language_outlined,
                                    size: 18,
                                    color: Color(0xffB07568),
                                  ),
                                  Text(
                                    recipeList[index].cuisineType.toUpperCase(),
                                    style: TextStyle(
                                        color: Color(0xffB07568),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            height: 20,
                            width: 100,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Color(0xffFFEDE9),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5))),
                            child: Center(
                              child: Text(
                                recipeList[index].label.toString(),
                                style: TextStyle(
                                    color: Color(0xffB07568),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
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
