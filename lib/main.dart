import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/authentication_provider.dart';
import 'package:money_manager/home.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:money_manager/logIn.dart';
import 'package:money_manager/signUp.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(brightness: Brightness.light),
        home: new MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
    }
    return OptionsPage();
  }
}

class OptionsPage extends StatefulWidget {
  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey<ScaffoldState>();
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
                  new Padding(padding: const EdgeInsets.only(top: 20)),
                  new Row(
                    children: [
                      new Text("Welcome",
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
                    padding: const EdgeInsets.only(top: 40),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      new RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LogInPage()));
                          },
                          color: Colors.black,
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: new Padding(
                            padding: const EdgeInsets.all(5),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new SvgPicture.asset(
                                  "assets/icons/email.svg",
                                  width: 50,
                                  height: 50,
                                ),
                                new Text("Login with E-Mail",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ))
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 40),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      new RaisedButton(
                          onPressed: () {
                            final snackb = new SnackBar(
                                backgroundColor: Colors.black,
                                duration: new Duration(seconds: 4),
                                content: new Text("Still Under Development :(",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)));
                            scaffkey.currentState.showSnackBar(snackb);
                          },
                          color: Colors.black,
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: new Padding(
                            padding: const EdgeInsets.all(10),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new SvgPicture.asset(
                                  "assets/icons/google.svg",
                                  width: 50,
                                  height: 40,
                                ),
                                new Text("Login with Google",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ))
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 40),
                  ),
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
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 150),
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
          ),
        ));
  }
}
