// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './search_bar.dart';
import 'show_recipe.dart';
import './models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipeList = <Recipe>[];
  void clearList() {
    setState(() {
      recipeList.clear();
    });
  }

  void _addNew(Recipe recipe) {
    setState(() {
      recipeList.add(recipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xffF0F1FA),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    padding: EdgeInsets.all(8),
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: SearchBar(_addNew, clearList),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: RichText(
                    text: TextSpan(
                        text: "WHAT RECIPE WILL YOU CHOOSE TO CREATE ",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: " Mealtime Magic?",
                            style: GoogleFonts.dancingScript(
                                fontSize: 20, color: Color(0xffC26522)),
                          )
                        ]),
                  ),
                ),
                ShowRecipe(recipeList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
