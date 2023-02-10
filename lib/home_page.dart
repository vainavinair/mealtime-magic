// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipeList = <Recipe>[];

  TextEditingController searchController = new TextEditingController();
  String url =
      "https://api.edamam.com/api/recipes/v2?type=public&q=chicken&app_id=ed8282b8&app_key=8a4d8c94b108fd3185d0d43e332d4768";

  @override
  Widget build(BuildContext context) {
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
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.search,
                            color: Color(0xffC26522),
                          ),
                          onTap: () {
                            _submitData(searchController.text);
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
                            onSubmitted: (_) =>
                                _submitData(searchController.text),
                          ),
                        )
                      ],
                    ),
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
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 112,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text("dete");
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _submitData(String query) async {
    String url =
        'https://api.edamam.com/api/recipes/v2?type=public&q=${query}&app_id=ed8282b8&app_key=8a4d8c94b108fd3185d0d43e332d4768';
    var response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    // print(data);

    data['hits'].forEach((element) {
      Recipe recipe = new Recipe();
      recipe = Recipe.fromMap(element["recipe"]);
      recipeList.add(recipe);
    });
    // log(recipeList.toString());

    recipeList.forEach((element) {
      print(element.label);
    });
  }
}

Widget manni() {
  return Text("Heelo");
}
