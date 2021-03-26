import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String mail;
  String password;

  Future<void> signUp() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        await Firebase.initializeApp();
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail, password: password);
        Navigator.pop(context);
      } catch (e) {
        print(e);
      }
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
            child: new Column(
              children: [
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
                    new Text("New,",
                        style: GoogleFonts.poppins(
                            fontSize: 52,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                new Row(
                  children: [
                    new Text("Sign-Up",
                        style: GoogleFonts.poppins(
                            fontSize: 52,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                    new Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6)),
                    new Column(
                      children: [
                        new Padding(
                          padding: const EdgeInsets.only(top: 25),
                        ),
                        new CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 6,
                        )
                      ],
                    )
                  ],
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),
                new Form(
                    key: formKey,
                    child: new Column(
                      children: [
                        new TextFormField(
                          decoration: new InputDecoration(
                              hintText: "Enter Mail",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 25,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500)),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) =>
                              val.contains("@") ? null : "Enter Valid Mail ID",
                          onSaved: (val) => mail = val,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 5),
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 25,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500)),
                          keyboardType: TextInputType.name,
                          obscureText: true,
                          validator: (val) =>
                              val.length < 3 ? "Enter Bigger Password" : null,
                          onSaved: (val) => password = val,
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: new Text("Sign-Up",
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      onPressed: signUp,
                      color: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//assets/logo/logo.JPG
