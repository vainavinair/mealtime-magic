// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'dart:async';

import 'home_page.dart';
import 'recipe_view.dart';
import './widgets/search_bar.dart';

import 'models/recipe.dart';
import 'package:flutter/material.dart';

import 'api_handler.dart';

class ShowRecipe extends StatefulWidget {
  late String query;

  ShowRecipe(this.query);

  @override
  State<ShowRecipe> createState() => _ShowRecipeState();
}

class _ShowRecipeState extends State<ShowRecipe> {
  List<Recipe> recipeList = <Recipe>[];
  Timer? _timer;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadRecipes();
    _timer = Timer(Duration(seconds: 10), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  _loadRecipes() async {
    List<Recipe> recipes = await ApiHandler.recipesByquery(widget.query);
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
          // SEARCH BAR
          title: SearchBar(),
        ),
        body: isLoading == false
            ? Center(
                child: Container(
                child: Column(
                  children: [
                    Text(
                      "NO RECIPIES FOUND",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Image.asset('assets/images/notfound.png')
                  ],
                ),
              ))
            : recipeList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Container(
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
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(),
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
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                              bottomRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5))),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.language_outlined,
                                              size: 18,
                                              color: Color(0xffB07568),
                                            ),
                                            Text(
                                              recipeList[index]
                                                  .cuisineType
                                                  .toUpperCase(),
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
                                              topRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(16),
                                              bottomRight:
                                                  Radius.circular(16))),
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
