abstract class ScienceStates {}

class ScienceInitialState extends ScienceStates {}

class GetScienceNewsSuccessState extends ScienceStates {}

class GetScienceNewsLoadingState extends ScienceStates {}

class GetScienceNewsErrorState extends ScienceStates {
  final error;

  GetScienceNewsErrorState(this.error);
}
