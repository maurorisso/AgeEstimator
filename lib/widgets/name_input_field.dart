import 'package:age_estimator/theme.dart';
import 'package:flutter/material.dart';

class NameInputField extends StatefulWidget {
  const NameInputField({
    super.key,
    required this.nameController,
    required this.onSubmitted,
  });
  final TextEditingController nameController;
  final VoidCallback onSubmitted;

  @override
  State<NameInputField> createState() => _NameInputFieldState();
}

class _NameInputFieldState extends State<NameInputField> {
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
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: widget.nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: "Enter a name here",
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 48,
          width: 48,
          child: IconButton( 
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(AppColors.primaryColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            onPressed: widget.onSubmitted,
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
