import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/views/business/controllers/controllers.dart';
import 'package:news_app_with_jemy/views/home/controllers/controllers.dart';
import 'package:news_app_with_jemy/views/home/states/states.dart';
import 'package:news_app_with_jemy/views/splash/splash_screen.dart';

import 'BlocObserver.dart';
import 'core/remote/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeAppCubit(),
        ),
        BlocProvider(
          create: (context) => BusinessCubit()..getBusiness(),
        ),
      ],
      child: BlocConsumer<HomeAppCubit,HomeAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.deepOrange, fontFamily: 'Ubuntu'),
              home: SplashScreen(),
            );
          }),
    );
  }
}
