import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:news_app_with_jemy/core/remote/dio_helper.dart';
import 'package:news_app_with_jemy/core/utils/contants.dart';
import 'package:news_app_with_jemy/views/sports/states/sports_states.dart';

class SportsCubit extends Cubit<SportsStates> {
  SportsCubit() : super(SportsInitialState());
  static SportsCubit get(context) => BlocProvider.of(context);

  NewsModel? newsModelSports;

  void getSportsNews() {
    emit(GetSportsNewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': apiKey,
    }).then((value) {
      newsModelSports = NewsModel.fromJson(value.data);
      emit(GetSportsNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportsNewsErrorState(error));
    });
  }
}
