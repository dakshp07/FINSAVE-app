import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
          padding: const EdgeInsets.only(top: 40),
          child: new Column(
            children: [
              new Row(
                children: [
                  new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5)),
                  new Image.asset("assets/logo/logo.JPG",
                      width: 90, height: 140),
                  new Text("FINSAVE",
                      style: GoogleFonts.poppins(
                          fontSize: 35, fontWeight: FontWeight.w700)),
                  new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5)),
                  new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45)),
                  new Icon(
                    Icons.settings,
                    size: 45,
                    color: Colors.black,
                  )
                ],
              )
            ],
          )),
    );
  }
}
