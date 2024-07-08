import 'package:flutter/material.dart';
import 'package:age_estimator/models/person.dart';
import 'package:age_estimator/widgets/name_age_list.dart';
import 'package:age_estimator/widgets/name_input_field.dart';
import 'package:age_estimator/widgets/shared/separator.dart';
import 'package:age_estimator/widgets/shared/styled_text.dart';
import 'package:uuid/uuid.dart';
import '../api/age_estimator_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController nameController = TextEditingController();
  String errorMessage = '';
  Person? currentResult;
  List<Person> mockPeople;
  bool isLoading = false; // To track loading state
  final AgeEstimatorApi api = AgeEstimatorApi(); // API class instance

  _HomeState()
      : mockPeople = [
          Person(name: "Alice", age: 25, id: const Uuid().v4()),
          Person(name: "Bob", age: 30, id: const Uuid().v4()),
          Person(name: "Charlie", age: 22, id: const Uuid().v4()),
        ];

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

  String formatName(String name) {
    if (name.isEmpty) return "";
    return name[0].toUpperCase() + name.substring(1).toLowerCase();
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
            if (isLoading) ...[
              const Separator(SizeOption.medium),
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              ),
            ],
            if (currentResult != null) ...[
              const Separator(SizeOption.medium),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    // Default text style for the whole line
                    fontSize: 16, // Slightly larger text
                    color: Colors.black, // Default text color
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${formatName(currentResult!.name)} ', // Name part
                      style: const TextStyle(
                        fontWeight: FontWeight.w600, // Make name bold
                      ),
                    ),
                    const TextSpan(
                      text: 'is ', // Intermediate text
                    ),
                    TextSpan(
                      text: '${currentResult!.age} ', // Age part
                      style: const TextStyle(
                        fontWeight: FontWeight.w600, // Make age bold
                      ),
                    ),
                    const TextSpan(
                      text: 'years old', // Suffix
                    ),
                  ],
                ),
              )
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

  void handleSubmit() async {
    if (nameController.text.trim().isEmpty) {
      setState(() {
        currentResult = null;
        errorMessage = 'Please enter a valid name.';
      });
      return;
    }

    setState(() {
      isLoading = true; // Start loading before the API call
    });

    final int? age = await api.getAgeEstimate(nameController.text);

    setState(() {
      isLoading = false;
      if (age != null) {
        Person newPerson = Person(
            name: formatName(nameController.text),
            age: age,
            id: const Uuid().v4());
        mockPeople.insert(0, newPerson);
        currentResult = newPerson;
        errorMessage = '';
      } else {
        errorMessage =
            "Uh oh. '${nameController.text}' is unknown to us. Please try another name";
        currentResult = null;
      }
      nameController.clear();
    });
  }

  void removePerson(Person person) {
    setState(() {
      mockPeople.removeWhere((p) => p.id == person.id);
    });
  }
}
