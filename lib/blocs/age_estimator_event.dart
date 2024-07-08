part of 'age_estimator_bloc.dart';

@immutable
abstract class AgeEstimatorEvent {}

class GetAgeEstimateEvent extends AgeEstimatorEvent {
  final String name;

  GetAgeEstimateEvent(this.name);
}

class DeletePersonEvent extends AgeEstimatorEvent {
  final Person person;

  DeletePersonEvent(this.person);
}
