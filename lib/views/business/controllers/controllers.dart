import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:news_app_with_jemy/core/remote/dio_helper.dart';
import 'package:news_app_with_jemy/core/utils/contants.dart';
import 'package:news_app_with_jemy/views/business/states/states.dart';

class BusinessCubit extends Cubit<BusinessStates>{
  BusinessCubit() : super(InitialBusinessState());

  static BusinessCubit get(context) => BlocProvider.of(context);

 // List<dynamic> business = [];

  NewsModel? newsModelBusiness;

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'us',
        'category':'business',
        'apiKey': apiKey,
      },
    ).then((value)
    {
      //business = value.data['articles'];
      print('##########################');
      //print(business[0]['title']);
      newsModelBusiness = NewsModel.fromJson(value.data);
      print(value.data.toString());
      //newsModelBusiness = NewsModel.fromJson(json.decode(value.data.toString()));
      //var s = newsModelFromJson(value.data.toString());
     // var s1 = newsModelToJson(value.data);
      //print(s);
      //print(s1);


      //print(business[0]['title']);
     // print(newsModelBusiness.toString());

      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

}