import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app_with_jemy/core/utils/color.dart';
import 'package:news_app_with_jemy/views/business/business_screen.dart';
import 'package:news_app_with_jemy/views/layout/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LayoutScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}