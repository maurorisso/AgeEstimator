import 'package:age_estimator/widgets/name_input_field.dart';
import 'package:flutter/material.dart';
import 'package:age_estimator/widgets/shared/separator.dart';
import 'package:age_estimator/widgets/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController nameController = TextEditingController();
  String estimatedAge = '';

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
            const StyledMediumText(
              'Estimate the Age of a Name',
            ),
            const Separator(SizeOption.medium),
            NameInputField(
                controller: nameController, onSubmitted: _estimateAge),
            const Separator(SizeOption.small),
            if (estimatedAge.isNotEmpty) ...[
              const Separator(SizeOption.medium),
              Text('Estimated Age: $estimatedAge'),
            ],
          ],
        ),
      ),
    );
  }

  void _estimateAge() {
    setState(() {
      estimatedAge = 'Approximately 25 years'; // Simulate an API response
    });
  }
}
