import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app_with_jemy/core/sharedHelper/shared_helper.dart';
import 'package:news_app_with_jemy/core/utils/color.dart';

import 'package:news_app_with_jemy/views/home/home_view.dart';

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
      CacheHelper.saveData(
        key: 'onBoarding',
        value: true,
      ).then((value) {
        if (value) {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutScreen()));
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LayoutScreen(),
              ),
              (route) => false);
        }
      });
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
