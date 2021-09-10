abstract class SportsStates {}

class SportsInitialState extends SportsStates {}

class GetSportsNewsSuccessState extends SportsStates {}

class GetSportsNewsLoadingState extends SportsStates {}

class GetSportsNewsErrorState extends SportsStates {
  final error;

  GetSportsNewsErrorState(this.error);
}
