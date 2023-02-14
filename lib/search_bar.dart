// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:mealtime_magic/show_recipe.dart';

class SearchBar extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  late Function(String) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Icon(Icons.search, color: Color(0xff000000)),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => ShowRecipe(searchController.text))));
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
            // onSubmitted: (_) => _search(searchController.text),
            onSubmitted: ((value) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        ShowRecipe(searchController.text))))),
          ),
        )
      ],
    );
  }
}
