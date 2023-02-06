// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xffF0F1FA),
          ),
          Column(
            children: [
              Container(
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
                      onTap: () {},
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
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: RichText(
                  text: TextSpan(
                      text: "WHAT RECIPE WILL YOU CHOOSE TO CREATE ",
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: " Mealtime Magic?",
                          style: GoogleFonts.dancingScript(
                              fontSize: 32, color: Color(0xffC26522)),
                        )
                      ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
