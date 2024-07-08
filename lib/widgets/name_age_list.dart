import 'package:age_estimator/widgets/name_age_item.dart';
import 'package:flutter/material.dart';
import '../models/person.dart';

class NameAgeList extends StatelessWidget {
  final List<Person> people;
  final Function(Person) onRemove;

  const NameAgeList({super.key, required this.people, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];
        return Dismissible(
          key: Key(person.id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 10),
            margin: const EdgeInsets.only(bottom: 10),
            child: const Icon(Icons.delete, color: Colors.white, size: 30),
          ),
          onDismissed: (direction) {
            onRemove(person);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${person.name} deleted')),
            );
          },
          child: NameAgeItem(person: person),
        );
      },
    );
  }
}
