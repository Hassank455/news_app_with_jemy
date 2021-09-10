abstract class HealthStates {}

class HealthInitialState extends HealthStates {}

class GetHealthNewsSuccessState extends HealthStates {}

class GetHealthNewsLoadingState extends HealthStates {}

class GetHealthNewsErrorState extends HealthStates {
  final error;

  GetHealthNewsErrorState(this.error);
}
