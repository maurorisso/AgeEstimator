import 'package:flutter_test/flutter_test.dart';
import 'package:age_estimator/blocs/age_estimator_bloc.dart';
import 'package:age_estimator/models/person.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('AgeEstimatorState Tests', () {
    test('AgeEstimatorInitial initializes with default persons', () {
      final state = AgeEstimatorInitial();
      expect(state.persons.length, 3);
      expect(state.persons[0].name, 'Alice');
      expect(state.persons[1].name, 'Bob');
      expect(state.persons[2].name, 'Charlie');
    });

    test('AgeEstimatorLoading state', () {
      final persons = [Person(name: 'Test', age: 40, id: const Uuid().v4())];
      final state = AgeEstimatorLoading(persons, isNewItemLoading: true);
      expect(state.persons, persons);
      expect(state.isNewItemLoading, true);
    });

    test('AgeEstimatorLoaded state', () {
      final persons = [Person(name: 'Test', age: 40, id: const Uuid().v4())];
      final state = AgeEstimatorLoaded(persons);
      expect(state.persons, persons);
    });

    test('AgeEstimatorError state', () {
      final persons = [Person(name: 'Test', age: 40, id: const Uuid().v4())];
      final state = AgeEstimatorError('Error message', persons);
      expect(state.message, 'Error message');
      expect(state.persons, persons);
    });

    test('AgeEstimatorStateX extension methods', () {
      final initial = AgeEstimatorInitial();
      final loading =
          AgeEstimatorLoading(initial.persons, isNewItemLoading: true);
      final loaded = AgeEstimatorLoaded(initial.persons);
      final error = AgeEstimatorError('Error message', initial.persons);

      expect(initial.isLoading, false);
      expect(loading.isLoading, true);
      expect(loaded.isLoading, false);
      expect(error.isLoading, false);

      expect(initial.isError, false);
      expect(loading.isError, false);
      expect(loaded.isError, false);
      expect(error.isError, true);

      expect(initial.isLoaded, false);
      expect(loading.isLoaded, false);
      expect(loaded.isLoaded, true);
      expect(error.isLoaded, false);

      expect(initial.persons.length, 3);
      expect(loading.persons.length, 3);
      expect(loaded.persons.length, 3);
      expect(error.persons.length, 3);

      expect(loading.isNewItemLoading, true);
      expect((loading as AgeEstimatorLoading).isNewItemLoading, true);
      expect(loaded.isNewItemLoading, false);

      expect(error.errorMessage, 'Error message');
    });
  });
}
