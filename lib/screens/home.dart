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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const Text(
                    "At 'Age Estimator', we help you estimate your age based on your name. Enter your name below and we'll do the rest!"),
                const SizedBox(height: 20),
                const Text(
                  'Get started by entering a name below:',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Estimate'),
                ),
              ],
            )));
  }
}
