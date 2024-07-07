import 'package:age_estimator/widgets/shared/separator.dart';
import 'package:age_estimator/widgets/shared/styled_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Age Estimator ☕︎',
          ),
        ),
        body: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const StyledText(
                  "At 'Age Estimator', we help you estimate your age based on your name. Enter your name below and we'll do the rest!",
                ),
                const Separator(SizeOption.medium),
                const StyledMediumText('Discover Your Age Through Your Name:'),
                const Separator(SizeOption.small),
                const TextField(
                  keyboardType: TextInputType.name,
                ),
                const Separator(SizeOption.small),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Estimate'),
                ),
              ],
            )));
  }
}
