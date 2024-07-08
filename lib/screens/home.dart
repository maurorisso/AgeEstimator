import 'package:age_estimator/models/person.dart';
import 'package:age_estimator/widgets/name_age_list.dart';
import 'package:age_estimator/widgets/name_input_field.dart';
import 'package:flutter/material.dart';
import 'package:age_estimator/widgets/shared/separator.dart';
import 'package:age_estimator/widgets/shared/styled_text.dart';
import 'package:uuid/uuid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController nameController = TextEditingController();
  String result = '';
  String errorMessage = '';
  Person? currentResult;
  List<Person> mockPeople;

  _HomeState()
      : mockPeople = [
          Person(name: "Alice", age: 25, id: const Uuid().v4()),
          Person(name: "Bob", age: 30, id: const Uuid().v4()),
          Person(name: "Charlie", age: 22, id: const Uuid().v4()),
        ];

  void removePerson(Person person) {
    setState(() {
      mockPeople.removeWhere((p) => p.id == person.id);
    });
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(_clearErrorMessage);
  }

  void _clearErrorMessage() {
    if (errorMessage.isNotEmpty && nameController.text.isNotEmpty) {
      setState(() {
        errorMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Estimator ☕︎'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const StyledMediumText('Estimate the Age of a Name'),
            const Separator(SizeOption.medium),
            NameInputField(
                nameController: nameController, onSubmitted: handleSubmit),
            if (errorMessage.isNotEmpty) ...[
              const Separator(SizeOption.medium),
              Text(errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 12)),
            ],
            if (currentResult != null) ...[
              const Separator(SizeOption.medium),
              StyledText(
                  '${currentResult!.name} is ${currentResult!.age} years old'),
            ],
            const Separator(SizeOption.medium),
            if (mockPeople.isNotEmpty) ...[
              Container(
                  alignment: Alignment.centerLeft,
                  child: const StyledSmallText("Previous Names:")),
              const Separator(SizeOption.small),
            ],
            Expanded(
              child: NameAgeList(people: mockPeople, onRemove: removePerson),
            ),
          ],
        ),
      ),
    );
  }

  void handleSubmit() {
    if (nameController.text.trim().isEmpty) {
      setState(() {
        currentResult = null;
        errorMessage = 'Please enter a valid name.';
      });
      return;
    }

    setState(() {
      errorMessage = '';

      if (currentResult != null) {
        mockPeople.insert(0, currentResult!);
      }

      int estimatedAge = 14;
      currentResult = Person(
          name: nameController.text, age: estimatedAge, id: const Uuid().v4());
      nameController.clear();
    });
  }
}
