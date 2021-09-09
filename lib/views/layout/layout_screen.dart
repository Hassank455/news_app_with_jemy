import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/core/utils/color.dart';
import 'package:news_app_with_jemy/views/layout/cubit/cubit.dart';
import 'package:news_app_with_jemy/views/layout/cubit/states.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {

      },
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(title: Row(
            children: [
              Image.asset('assets/images/logo.png',width: 40,),
              SizedBox(width: 10,),
              Text('Just News',style: TextStyle(fontFamily: 'Ubuntu',),),
            ],
          ),),
          bottomNavigationBar: FloatingNavbar(
            items: AppCubit.get(context).items,
            currentIndex: AppCubit.get(context).currentIndex,
            onTap: (index){
              AppCubit.get(context).navbarChanger(index);
            },
            backgroundColor: orangeColors,
          ),
          body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
        );
      },),
    );
  }
}
