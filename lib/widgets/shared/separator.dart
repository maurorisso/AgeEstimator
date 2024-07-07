import 'package:flutter/material.dart';

enum SizeOption { small, medium, large }

class Separator extends StatelessWidget {
  const Separator(this.size, {super.key});

  final SizeOption size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size == SizeOption.small
          ? 10
          : size == SizeOption.medium
              ? 20
              : 40,
    );
  }
}
