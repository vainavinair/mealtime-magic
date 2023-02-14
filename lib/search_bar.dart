// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:mealtime_magic/show_recipe.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
  Function(String value)? onSubmitted;
  SearchBar({this.onSubmitted});
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Icon(Icons.search, color: Color(0xff000000)),
          onTap: () {
            if (widget.onSubmitted != null) {
              widget.onSubmitted!(searchController.text);
            }
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
            onSubmitted: widget.onSubmitted,
          ),
        )
      ],
    );
  }
}
