part of 'age_estimator_bloc.dart';

@immutable
abstract class AgeEstimatorState {
  const AgeEstimatorState();
}

class AgeEstimatorInitial extends AgeEstimatorState {
  final List<Person> persons;

  AgeEstimatorInitial()
      : persons = [
          Person(name: "Alice", age: 25, id: const Uuid().v4().toString()),
          Person(name: "Bob", age: 30, id: const Uuid().v4().toString()),
          Person(name: "Charlie", age: 22, id: const Uuid().v4().toString()),
        ];
}

class AgeEstimatorLoading extends AgeEstimatorState {
  final List<Person> persons;
  final bool isNewItemLoading;

  const AgeEstimatorLoading(this.persons, {this.isNewItemLoading = false});
}

class AgeEstimatorLoaded extends AgeEstimatorState {
  final List<Person> persons;
  const AgeEstimatorLoaded(this.persons);
}

class AgeEstimatorError extends AgeEstimatorState {
  final String message;
  final List<Person> persons;
  const AgeEstimatorError(this.message, this.persons);
}

extension AgeEstimatorStateX on AgeEstimatorState {
  bool get isLoading => this is AgeEstimatorLoading;
  bool get isError => this is AgeEstimatorError;
  bool get isLoaded => this is AgeEstimatorLoaded;
  List<Person> get persons => this is AgeEstimatorLoaded ||
          this is AgeEstimatorError ||
          this is AgeEstimatorInitial
      ? (this as dynamic).persons
      : [];
  bool get isNewItemLoading =>
      this is AgeEstimatorLoading &&
      (this as AgeEstimatorLoading).isNewItemLoading;
  String get errorMessage =>
      this is AgeEstimatorError ? (this as AgeEstimatorError).message : '';
}
