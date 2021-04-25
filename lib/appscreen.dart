import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
            child: new Container(
                padding: const EdgeInsets.only(top: 40),
                child: new Column(children: [
                  new Row(
                    children: [
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5)),
                      new IconButton(
                        icon: new Icon(Icons.arrow_back, color: Colors.black),
                        iconSize: 30,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5)),
                      new Text("About App",
                          style: GoogleFonts.poppins(
                              fontSize: 25, fontWeight: FontWeight.w700)),
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 65)),
                      new IconButton(
                        icon: new Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        iconSize: 30,
                        onPressed: () {},
                      )
                    ],
                  ),
                ]))));
  }
}
