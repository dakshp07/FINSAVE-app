import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  HomeScreen({this.name});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: new Drawer(
          child: new ListView(
            children: [
              new UserAccountsDrawerHeader(
                decoration: new BoxDecoration(color: Colors.black),
                accountName: new Text(widget.name,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w700)),
                accountEmail: new Text(user.email,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w700)),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: new StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(user.uid)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData)
                return new Center(child: new CircularProgressIndicator());
              return new Container(
                padding: const EdgeInsets.only(top: 40),
                child: new Column(
                  children: [
                    new Row(
                      children: [
                        new Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5)),
                        new IconButton(
                          icon: new Icon(Icons.menu, color: Colors.black),
                          iconSize: 45,
                          onPressed: () =>
                              _scaffoldKey.currentState.openDrawer(),
                        ),
                        new Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5)),
                        new Image.asset("assets/logo/logo.JPG",
                            width: 90, height: 140),
                        new Text("FINSAVE",
                            style: GoogleFonts.poppins(
                                fontSize: 35, fontWeight: FontWeight.w700)),
                        new Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8)),
                        new IconButton(
                          icon: new Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                          iconSize: 45,
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
