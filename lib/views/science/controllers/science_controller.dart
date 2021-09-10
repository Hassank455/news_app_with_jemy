import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:news_app_with_jemy/core/remote/dio_helper.dart';
import 'package:news_app_with_jemy/core/utils/contants.dart';
import 'package:news_app_with_jemy/views/science/states/science_states.dart';

class ScienceCubit extends Cubit<ScienceStates> {
  ScienceCubit() : super(ScienceInitialState());
  static ScienceCubit get(context) => BlocProvider.of(context);

  NewsModel? newsModelScience;

  void getScienceNews() {
    emit(GetScienceNewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': apiKey,
    }).then((value) {
      newsModelScience = NewsModel.fromJson(value.data);
      emit(GetScienceNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetScienceNewsErrorState(error));
    });
  }
}
