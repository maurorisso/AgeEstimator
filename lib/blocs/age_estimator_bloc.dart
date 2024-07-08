import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../api/age_estimator_api.dart';
import '../models/person.dart';
import 'package:uuid/uuid.dart';

part 'age_estimator_event.dart';
part 'age_estimator_state.dart';

class AgeEstimatorBloc extends Bloc<AgeEstimatorEvent, AgeEstimatorState> {
  final AgeEstimatorApi api;

  AgeEstimatorBloc({required this.api}) : super(AgeEstimatorInitial()) {
    onFetch();

    onDelete();
  }
  String capitalizeFirstLetter(String name) {
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1).toLowerCase();
  }

  void onFetch() {
    return on<GetAgeEstimateEvent>((event, emit) async {
      List<Person> currentPersons = state.persons;

      emit(AgeEstimatorLoading(currentPersons, isNewItemLoading: true));

      try {
        final age = await api.getAgeEstimate(event.name);
        if (age != null) {
          final person = Person(
              name: capitalizeFirstLetter(event.name),
              age: age,
              id: const Uuid().v4());
          final updatedPersons = List<Person>.from(currentPersons)
            ..insert(0, person);
          emit(AgeEstimatorLoaded(updatedPersons));
        } else {
          emit(AgeEstimatorError(
              "Failed to fetch, try again later.", currentPersons));
        }
      } catch (e) {
        emit(AgeEstimatorError(e.toString(), currentPersons));
      }
    });
  }

  void onDelete() {
    return on<DeletePersonEvent>((event, emit) {
      final List<Person> persons = state is AgeEstimatorLoaded
          ? (state as AgeEstimatorLoaded).persons
          : (state is AgeEstimatorInitial
              ? (state as AgeEstimatorInitial).persons
              : <Person>[]);

      final updatedPersons = List<Person>.from(persons)
        ..removeWhere((p) => p.id == event.person.id);
      emit(AgeEstimatorLoaded(updatedPersons));
    });
  }
}
