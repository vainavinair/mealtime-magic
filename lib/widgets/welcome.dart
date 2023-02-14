// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'intro.dart';
import '../home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                'assets/images/welcome.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/mml.png'),
                SizedBox(
                  height: 50,
                ),
                //calling INTRO WIDGET
                SizedBox(height: 80, child: Intro()),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "CONTINUE",
                    style: GoogleFonts.merriweather(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffDCDCDD),
                    foregroundColor: Color(0xffC26522),
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
