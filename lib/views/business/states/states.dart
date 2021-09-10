abstract class BusinessStates {}

class InitialBusinessState extends BusinessStates {}

class NewsGetBusinessLoadingState extends BusinessStates {}

class NewsGetBusinessSuccessState extends BusinessStates {}

class NewsGetBusinessErrorState extends BusinessStates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}