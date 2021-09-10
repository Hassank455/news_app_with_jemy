import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/core/utils/color.dart';
import 'package:news_app_with_jemy/views/home/components/home_app_bar.dart';
import 'package:news_app_with_jemy/views/home/states/states.dart';

import 'controllers/controllers.dart';

class LayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeAppCubit, HomeAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: homeAppBar(),
          bottomNavigationBar: FloatingNavbar(
            items: HomeAppCubit.get(context).items,
            currentIndex: HomeAppCubit.get(context).currentIndex,
            onTap: (index) {
              HomeAppCubit.get(context).navbarChanger(index);
            },
            backgroundColor: orangeColors,
          ),
          body: HomeAppCubit.get(context)
              .screens[HomeAppCubit.get(context).currentIndex],
        );
      },
    );
  }
}
