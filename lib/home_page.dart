// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './recipe_view.dart';
import 'widgets/search_bar.dart';
import 'api_handler.dart';
import 'models/recipe.dart';

class HomePage extends StatefulWidget {
  final String urlRandom =
      'https://api.edamam.com/api/recipes/v2?type=public&app_id=ed8282b8&app_key=%208a4d8c94b108fd3185d0d43e332d4768%09&imageSize=REGULAR&random=true';
  final String urlAmerican =
      'https://api.edamam.com/api/recipes/v2?type=public&app_id=ed8282b8&app_key=%208a4d8c94b108fd3185d0d43e332d4768&cuisineType=American';
  final String urlChinese =
      'https://api.edamam.com/api/recipes/v2?type=public&app_id=ed8282b8&app_key=%208a4d8c94b108fd3185d0d43e332d4768&cuisineType=Chinese';
  final String urlJapanese =
      'https://api.edamam.com/api/recipes/v2?type=public&app_id=ed8282b8&app_key=%208a4d8c94b108fd3185d0d43e332d4768&cuisineType=Japanese';
  final String urlItalian =
      'https://api.edamam.com/api/recipes/v2?type=public&app_id=ed8282b8&app_key=%208a4d8c94b108fd3185d0d43e332d4768&cuisineType=Italian';
  final String urlIndian =
      'https://api.edamam.com/api/recipes/v2?type=public&app_id=ed8282b8&app_key=%208a4d8c94b108fd3185d0d43e332d4768&cuisineType=Indian';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipeList = <Recipe>[];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadRecipes(widget.urlRandom);
  }

  _loadRecipes(url) async {
    setState(() {
      isLoading = true;
    });

    List<Recipe> recipes = await ApiHandler.recipesByUrl(url);
    setState(() {
      recipeList = recipes;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Theme.of(context).primaryColor,
          ),
          Column(
            children: [
              SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffEFF2F5),
                  ),
                  // SEARCH BAR
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _loadRecipes(widget.urlRandom);
                          },
                          child: Text("Home")),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _loadRecipes(widget.urlAmerican);
                          },
                          child: Text("American")),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _loadRecipes(widget.urlItalian);
                          },
                          child: Text("Italian")),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _loadRecipes(widget.urlIndian);
                          },
                          child: Text("Indian")),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _loadRecipes(widget.urlJapanese);
                          },
                          child: Text("Japanese")),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _loadRecipes(widget.urlChinese);
                          },
                          child: Text("Chinese"))
                    ],
                  ),
                ),
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      flex: 1,
                      child: Container(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(),
                                        fit: BoxFit.cover,
                                        height: 200,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      left: 0,
                                      bottom: 0,
                                      child: Container(
                                        height: 22,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFEDE9),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16),
                                            bottomRight: Radius.circular(16),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            recipeList[index].label.toString(),
                                            style: TextStyle(
                                                color: Color(0xffB07568),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
