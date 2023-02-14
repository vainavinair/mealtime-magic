// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
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
  ValueNotifier<String> dataNotifier =
      ValueNotifier("Discover new flavors, one recipe at a time");

  late Timer timer;
  @override
  void didChangeDependencies() {
    // Start Timer
    timer = Timer.periodic(Duration(seconds: 3), (_) {
      if (i == myIntros.length - 1) {
        i = 0;
      }
      dataNotifier.value = myIntros[i + 1];
      i++;
      // print(i);
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    timer.cancel(); //STOP TIMER
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: dataNotifier,
        builder: (context, value, child) {
          return Text(
            value,
            style: GoogleFonts.abrilFatface(
              color: Color(0xffDCDCDD),
              shadows: [
                Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(10, 1),
                    blurRadius: 5)
              ],
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          );
        });
  }
}
