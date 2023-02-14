// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xffC26522),
          iconTheme: (IconThemeData(color: Color(0xffDCDCDD))),
        ),
        primaryColor: Color.fromARGB(255, 215, 199, 193),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Color(0xffC26522), // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      home: WelcomePage(),
    );
  }
}
