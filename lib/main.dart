import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lokalwala/WelcomePage.dart';

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
  home: MainPage(),
  debugShowCheckedModeBanner: false,
));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration,navigationPage);
  }


  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomePage())) ;
  }

  @override
  void initState() {
    // TODO: implement initState
    startTime();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Container(
          width: 250,
          child: Image.asset("assets/images/lokalwala-logo.png"))),
    );
  }
}

