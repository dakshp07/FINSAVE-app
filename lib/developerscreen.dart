import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatefulWidget {
  @override
  _DeveloperScreenState createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new SingleChildScrollView(
        child: new Container(
          padding: const EdgeInsets.only(top: 40),
          child: new Column(
            children: [
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
                  new Text("About Developer",
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.w700)),
                  new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25)),
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
              new Padding(
                padding: const EdgeInsets.only(top: 100),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new CircleAvatar(
                    backgroundImage: new NetworkImage(
                      "https://avatars.githubusercontent.com/u/57083450?v=4",
                    ),
                    radius: 100,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 20),
                  ),
                  new Text("Daksh Paleria",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 30)),
                  new Padding(
                    padding: const EdgeInsets.only(top: 8),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text("Android Developer (Flutter) || Frontend",
                              style: GoogleFonts.poppins(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text(
                              "Web Developer and Designer || UI/UX Designer",
                              style: GoogleFonts.poppins(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      )
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 15),
                  ),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Image.asset(
                        "assets/icons/pin.png",
                        width: 25,
                        height: 25,
                      ),
                      new Text(" Vellore, Tamil Nadu, India",
                          style: GoogleFonts.poppins(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 40),
                  ),
                  new Text("Connect with me :)",
                      style: GoogleFonts.poppins(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                  new Padding(
                    padding: const EdgeInsets.only(top: 8),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      new GestureDetector(
                        child: new Image.asset(
                          "assets/icons/instagram.png",
                          width: 45,
                          height: 45,
                        ),
                        onTap: () {
                          launch("https://www.instagram.com/dakshp_07/");
                        },
                      ),
                      new GestureDetector(
                        child: new Image.asset(
                          "assets/icons/linkedin.png",
                          width: 45,
                          height: 45,
                        ),
                        onTap: () {
                          launch(
                              "https://www.linkedin.com/in/daksh-paleria-606211190/");
                        },
                      ),
                      new GestureDetector(
                        child: new Image.asset(
                          "assets/icons/github.png",
                          width: 45,
                          height: 45,
                        ),
                        onTap: () {
                          launch("https://github.com/dakshp07");
                        },
                      ),
                      new GestureDetector(
                        child: new Image.asset(
                          "assets/icons/gmail.png",
                          width: 45,
                          height: 45,
                        ),
                        onTap: () {
                          launch("mailto:dpaleria@gmail.com");
                        },
                      ),
                      new GestureDetector(
                        child: new Image.asset(
                          "assets/icons/behance.png",
                          width: 45,
                          height: 45,
                        ),
                        onTap: () {
                          launch("https://www.behance.net/dpaleria97c7");
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
