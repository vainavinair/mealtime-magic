// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import './models/recipe.dart';
import 'package:flutter/material.dart';

class ShowRecipe extends StatelessWidget {
  List<Recipe> recipeList;
  ShowRecipe(this.recipeList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: recipeList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                return;
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
                          Text(recipeList[index].totalTime.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
