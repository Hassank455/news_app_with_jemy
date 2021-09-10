import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:news_app_with_jemy/core/remote/dio_helper.dart';
import 'package:news_app_with_jemy/core/utils/contants.dart';
import 'package:news_app_with_jemy/views/health/states/health_states.dart';

class HealthCubit extends Cubit<HealthStates> {
  HealthCubit() : super(HealthInitialState());
  static HealthCubit get(context) => BlocProvider.of(context);

  NewsModel? newsModelHealth;

  void getHealthNews() {
    emit(GetHealthNewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'health',
      'apiKey': apiKey,
    }).then((value) {
      newsModelHealth = NewsModel.fromJson(value.data);
      emit(GetHealthNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetHealthNewsErrorState(error));
    });
  }
}
