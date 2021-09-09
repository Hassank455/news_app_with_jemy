import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_jemy/views/splash/splash_screen.dart';

import 'BlocObserver.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange,fontFamily: 'Ubuntu'),
      home: SplashScreen(),
    );
  }
}
