class Person {
  final String name;
  final int age;
  final String id;

  Person({required this.name, required this.age, required this.id});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.name == name &&
        other.age == age &&
        other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ id.hashCode;
}
