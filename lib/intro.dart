import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<String> myIntros = [
    "Discover new flavors, one recipe at a time",
    "Cook with confidence using our curated recipes",
    "Where every bite is a taste of adventure",
    "From kitchen to table, we've got you covered",
    "Fresh ideas for every meal, every day",
    "Making mealtime magic, one dish at a time",
    "Turn your kitchen into a gourmet delight",
    "Cooking made simple and delicious",
    "Inspiring home cooking, one recipe at a time"
  ];
  int i = 0;
  late String data = myIntros[i];

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (i == myIntros.length - 1) {
          i = 0;
        }
        data = myIntros[i + 1];
        i++;
        // print(i);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.abrilFatface(
        color: Theme.of(context).primaryColor,
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }
}
