// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealtime_magic/recipe_view.dart';
import './search_bar.dart';
import 'api_handler.dart';
import 'models/recipe.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipeList = <Recipe>[];

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  _loadRecipes() async {
    List<Recipe> recipes = await ApiHandler.random();
    setState(() {
      recipeList = recipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(recipeList.length);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xffF0F1FA),
          ),
          Column(
            children: [
              SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: SearchBar(),
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
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("data"))
                ],
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
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
                              Column(
                                children: [
                                  Text(recipeList[index].label),
                                  Text(recipeList[index].cuisineType),
                                  Text(recipeList[index].totalTime.toString())
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
