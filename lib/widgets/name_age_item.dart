import 'dart:math';

import 'package:age_estimator/theme.dart';
import 'package:flutter/material.dart';
import '../models/person.dart';

class NameAgeItem extends StatelessWidget {
  final Person person;

  const NameAgeItem({super.key, required this.person});

  static final Random _random = Random();
  static final List<IconData> _icons = [
    Icons.person,
    Icons.person_2,
    Icons.person_3,
    Icons.person_4,
  ];

  

  static IconData getRandomIcon() {
    return _icons[_random.nextInt(_icons.length)];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // delete when swiping left

      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: _itemTile(),
      ),
    );
  }

  ListTile _itemTile() {
    return ListTile(
      leading: Icon(
        getRandomIcon(),
        color: AppColors.primaryColor,
      ),
      title: Text(person.name, style: const TextStyle(color: Colors.black)),
      subtitle: Text('Estimated Age: ${person.age}',
          style: const TextStyle(color: Colors.black54)),
    );
  }
}
