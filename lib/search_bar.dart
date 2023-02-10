// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import './models/recipe.dart';
import 'dart:convert';
import 'package:http/http.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<Recipe> recipeList = <Recipe>[];
  TextEditingController searchController = TextEditingController();

  _search(String query) async {
    String url =
        'https://api.edamam.com/api/recipes/v2?type=public&q=${query}&app_id=ed8282b8&app_key=8a4d8c94b108fd3185d0d43e332d4768';
    var response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    // print(data);

    data['hits'].forEach((element) {
      Recipe recipe = Recipe();
      recipe = Recipe.fromMap(element["recipe"]);
      recipeList.add(recipe);
    });
    // log(recipeList.toString());

    recipeList.forEach((element) {
      print(element.label);
    });
    searchController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Icon(
            Icons.search,
            color: Color(0xffC26522),
          ),
          onTap: () {
            _search(searchController.text);
          },
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search for a recipe",
              border: InputBorder.none,
            ),
            onSubmitted: (_) => _search(searchController.text),
          ),
        )
      ],
    );
  }
}
