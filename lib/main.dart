import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/home.dart';
import 'package:money_manager/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey<ScaffoldState>();

  String mail;
  String password;
  String errorMessage;

  Future<void> signIn() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        await Firebase.initializeApp();
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: mail, password: password);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      } catch (e) {
        print(e);
        setState(() {
          errorMessage = e.toString();
        });
        final snackb = new SnackBar(
            backgroundColor: Colors.red,
            duration: new Duration(seconds: 6),
            content: new Text(
              errorMessage + " :(",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ));
        scaffkey.currentState.showSnackBar(snackb);
      }
    }
  }

  Future<void> resetPassword() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await Firebase.initializeApp();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: mail);
      final snackb = new SnackBar(
          backgroundColor: Colors.green[600],
          duration: new Duration(seconds: 6),
          content: new Text(
            "Please check your mail to reset the password :)",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ));
      scaffkey.currentState.showSnackBar(snackb);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffkey,
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
                    new Text("Hello,",
                        style: GoogleFonts.poppins(
                            fontSize: 52,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                new Row(
                  children: [
                    new Text("There",
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
                      child: new Text("Sign-In",
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      onPressed: signIn,
                      color: Colors.black,
                    ),
                    new Padding(padding: const EdgeInsets.only(top: 15)),
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => SignUp()));
                      },
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text("Not Registered ?",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                          new Text(
                            " Sign-Up",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.only(top: 15)),
                    new GestureDetector(
                      onTap: resetPassword,
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text("Forgot Password ?",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    )
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
