import 'package:age_estimator/models/person.dart';
import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  const ResultText({
    super.key,
    required this.persons,
  });

  final List<Person> persons;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: '${persons.first.name} ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const TextSpan(text: 'is '),
          TextSpan(
            text: '${persons.first.age} ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const TextSpan(text: 'years old'),
        ],
      ),
    );
  }
}
