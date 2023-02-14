// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'widgets/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            backgroundColor: Color(0xffC26522),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      home: WelcomePage(), // WELCOME PAGE
    );
  }
}
