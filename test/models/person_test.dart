import 'package:flutter_test/flutter_test.dart';
import 'package:age_estimator/models/person.dart';

void main() {
  group('Person Model Tests', () {
    test('Person properties should be correctly assigned', () {
      final person = Person(name: 'Alice', age: 30, id: '1');

      expect(person.name, 'Alice');
      expect(person.age, 30);
      expect(person.id, '1');
    });
    test('Two instances with same values should be equal', () {
      final person1 = Person(name: 'Bob', age: 25, id: '2');
      final person2 = Person(name: 'Bob', age: 25, id: '2');

      expect(person1, equals(person2));
    });
  });
}
