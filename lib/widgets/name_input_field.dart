import 'package:flutter/material.dart';

class NameInputField extends StatelessWidget {
  const NameInputField({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });
  final TextEditingController controller;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Type a name here",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8), // Spacing between TextField and Button
        SizedBox(
          height: 48, // Match the height of TextField's default height
          child: ElevatedButton(
            onPressed: onSubmitted,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary,
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: const Icon(Icons.search, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
