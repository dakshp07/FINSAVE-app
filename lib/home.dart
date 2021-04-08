import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/developerscreen.dart';
import 'package:money_manager/main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController money = new TextEditingController();

  User user = FirebaseAuth.instance.currentUser;
  Future<void> signOut() async {
    await Firebase.initializeApp();
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => OptionsPage()));
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(20),
            title: Text("Add Monthly Budget",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            content: TextField(
              controller: money,
              decoration: InputDecoration(
                  hintText: "Enter the amount",
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600])),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.black,
                child: Text('OK',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                onPressed: () {
                  if (money.text.isNotEmpty) {
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(user.uid)
                        .update({"monthly budget": "₹" + money.text});
                    Navigator.pop(context);
                    money.clear();
                  }
                },
              ),
              FlatButton(
                color: Colors.black,
                child: Text('Cancel',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                onPressed: () {
                  money.clear();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: new Drawer(
          child: new ListView(
            children: [
              new UserAccountsDrawerHeader(
                decoration: new BoxDecoration(color: Colors.black),
                accountName: new Text("Welcome to FINSAVE App :)",
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w600)),
                accountEmail: new Text("finsavehelp@gmail.com",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600])),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new AssetImage(
                    "assets/logo/logo.JPG",
                  ),
                  radius: 10,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 15),
              ),
              new GestureDetector(
                  child: new Row(
                    children: [
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(
                        Icons.home,
                        color: Colors.grey[800],
                        size: 30,
                      ),
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15)),
                      new Text("Home",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  onTap: () {}),
              new Padding(
                padding: const EdgeInsets.only(top: 25),
              ),
              new GestureDetector(
                  child: new Row(
                    children: [
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(
                        Icons.insert_emoticon,
                        color: Colors.grey[800],
                        size: 30,
                      ),
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15)),
                      new Text("My Profile",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  onTap: () {}),
              new Padding(
                padding: const EdgeInsets.only(top: 25),
              ),
              new GestureDetector(
                  child: new Row(
                    children: [
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(
                        Icons.notes,
                        color: Colors.grey[800],
                        size: 30,
                      ),
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15)),
                      new Text("My Monthly Report",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  onTap: () {}),
              new Padding(
                padding: const EdgeInsets.only(top: 25),
              ),
              new Divider(
                thickness: 2,
                color: Colors.grey[400],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 25),
              ),
              new GestureDetector(
                  child: new Row(
                    children: [
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(
                        Icons.settings,
                        color: Colors.grey[800],
                        size: 30,
                      ),
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15)),
                      new Text("Settings",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  onTap: () {}),
              new Padding(
                padding: const EdgeInsets.only(top: 25),
              ),
              new GestureDetector(
                  child: new Row(
                    children: [
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(
                        Icons.casino,
                        color: Colors.grey[800],
                        size: 30,
                      ),
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15)),
                      new Text("About App",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  onTap: () {}),
              new Padding(
                padding: const EdgeInsets.only(top: 25),
              ),
              new GestureDetector(
                  child: new Row(
                    children: [
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(
                        Icons.recent_actors,
                        color: Colors.grey[800],
                        size: 30,
                      ),
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15)),
                      new Text("About Developer",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DeveloperScreen()));
                  }),
              new Padding(
                padding: const EdgeInsets.only(top: 25),
              ),
              new Divider(
                thickness: 2,
                color: Colors.grey[400],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 25),
              ),
              new GestureDetector(
                  child: new Row(
                    children: [
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(
                        Icons.logout,
                        color: Colors.grey[800],
                        size: 30,
                      ),
                      new Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15)),
                      new Text("Logout",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  onTap: signOut),
              new Padding(
                padding: const EdgeInsets.only(top: 60),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text(
                    "Version 0.1.1",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text(
                    "Made with ",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  new SvgPicture.asset(
                    "assets/icons/love.svg",
                    width: 22,
                    height: 22,
                    color: Colors.red[600],
                  ),
                  new Text(
                    " by daksh",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        floatingActionButton: new Container(
          width: 60,
          height: 60,
          child: new FittedBox(
            child: new FloatingActionButton(
              backgroundColor: Colors.black,
              child: new Padding(
                padding: const EdgeInsets.all(5),
                child: new Icon(
                  Icons.add,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: new StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(user.uid)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData)
                return new Center(child: new CircularProgressIndicator());
              return new SingleChildScrollView(
                child: new Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: new Column(
                    children: [
                      new Row(
                        children: [
                          new Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5)),
                          new IconButton(
                            icon: new Icon(Icons.menu, color: Colors.black),
                            iconSize: 45,
                            onPressed: () =>
                                _scaffoldKey.currentState.openDrawer(),
                          ),
                          new Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5)),
                          new Image.asset("assets/logo/logo.JPG",
                              width: 90, height: 140),
                          new Text("FINSAVE",
                              style: GoogleFonts.poppins(
                                  fontSize: 35, fontWeight: FontWeight.w700)),
                          new Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8)),
                          new IconButton(
                            icon: new Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                            iconSize: 45,
                            onPressed: () {},
                          )
                        ],
                      ),
                      new GestureDetector(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              new Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: new Container(
                                  height: 160,
                                  decoration: new BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: new Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            new Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                            ),
                                            new Text("Your Balance",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white)),
                                            new Text(
                                                snapshot.data
                                                    .data()["monthly budget"],
                                                style: GoogleFonts.poppins(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            new Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                new Text("Tap here to",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        color: Colors.white)),
                                                new Text(
                                                    "change your monthly balance",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        color: Colors.white)),
                                              ],
                                            )
                                          ],
                                        ),
                                        new Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                        ),
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            new Icon(
                                              Icons.monetization_on,
                                              size: 70,
                                              color: Colors.white,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            _displayTextInputDialog(context);
                          }),
                      new Padding(
                        padding: const EdgeInsets.only(top: 10),
                      ),
                      new Column(
                        children: [
                          new SvgPicture.asset(
                            "assets/icons/illustration.svg",
                            width: 300,
                            height: 300,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 5),
                          ),
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              new Text(
                                "This list is looking empty...",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              new Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  new Text(
                                    "Tap on the + button to add a",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              new Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  new Text(
                                    " new income/expense.",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
