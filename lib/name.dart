import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/home.dart';

class NameScreen extends StatefulWidget {
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController fname = new TextEditingController();
  final TextEditingController lname = new TextEditingController();
  User user = FirebaseAuth.instance.currentUser;
  String fullName;

  void addName() {
    if (fname.text.isNotEmpty && lname.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        "first name": fname.text,
        "last name": lname.text,
        "monthly budget": "₹1000"
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(name: fullName)));
      setState(() {
        fullName = fname.text + " " + lname.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: new Container(
            padding: const EdgeInsets.only(top: 30),
            child: new Container(
                padding: const EdgeInsets.all(20),
                child: new SingleChildScrollView(
                    child: new Column(children: [
                  new Column(
                    children: [
                      new Image.asset(
                        "assets/logo/logo.JPG",
                        width: 100,
                        height: 150,
                      )
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 40)),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text("Hold On,",
                          style: GoogleFonts.poppins(
                              fontSize: 52,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  new Row(
                    children: [
                      new Text("Your Name ?",
                          style: GoogleFonts.poppins(
                              fontSize: 52,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 10),
                  ),
                  new Form(
                      child: new Column(
                    children: [
                      new TextFormField(
                        decoration: new InputDecoration(
                            hintText: "Enter First Name",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 25,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500)),
                        keyboardType: TextInputType.name,
                        controller: fname,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 5),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                            hintText: "Enter Last Name",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 25,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500)),
                        keyboardType: TextInputType.name,
                        controller: lname,
                      )
                    ],
                  )),
                  new Padding(
                    padding: const EdgeInsets.only(top: 22),
                  ),
                  new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        new RaisedButton(
                          padding: const EdgeInsets.all(6),
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: new Text("Let's Get Started",
                              style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          onPressed: addName,
                          color: Colors.black,
                        ),
                      ])
                ])))));
  }
}
