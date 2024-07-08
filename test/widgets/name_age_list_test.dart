import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:age_estimator/widgets/name_age_list.dart';
import 'package:age_estimator/models/person.dart';

void main() {
  group('NameAgeList Widget Tests', () {
    testWidgets('Should display list of names and ages',
        (WidgetTester tester) async {
      final persons = [
        Person(name: 'Alice', age: 30, id: '1'),
        Person(name: 'Bob', age: 22, id: '2')
      ];

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: NameAgeList(
            people: persons,
            onRemove: (person) {},
            hideFirstItem: false,
          ),
        ),
      ));

      expect(find.text('Alice'), findsOneWidget);
      expect(find.textContaining('30'), findsOneWidget);
      expect(find.text('Bob'), findsOneWidget);
    });
  });
}
