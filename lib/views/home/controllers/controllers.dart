import 'package:bloc/bloc.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/views/business/business_screen.dart';
import 'package:news_app_with_jemy/views/health/health_screen.dart';
import 'package:news_app_with_jemy/views/home/states/states.dart';

import 'package:news_app_with_jemy/views/science/science_screen.dart';
import 'package:news_app_with_jemy/views/sports/sports_screen.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<FloatingNavbarItem> items = [
    FloatingNavbarItem(title: 'Business',icon: Icons.attach_money),
    FloatingNavbarItem(title: 'Sports',icon: Icons.sports_basketball),
    FloatingNavbarItem(title: 'Science',icon: Icons.science_outlined),
    FloatingNavbarItem(title: 'Health',icon: Icons.health_and_safety),
  ];

  List screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    HealthScreen(),
  ];
  int currentIndex=0;
  void navbarChanger(int index){
    currentIndex=index;
    emit(NavBarChangerState());
  }


}