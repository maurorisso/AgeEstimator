import 'package:age_estimator/widgets/name_age_item.dart';
import 'package:flutter/material.dart';
import '../models/person.dart';

class NameAgeList extends StatelessWidget {
  final List<Person> people;

  const NameAgeList({super.key, required this.people});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: people.length,
      itemBuilder: (context, index) {
        return NameAgeItem(person: people[index]);
      },
    );
  }
}
