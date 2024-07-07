import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(),
    );
  }
}

class StyledMediumText extends StatelessWidget {
  const StyledMediumText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class StyledLargeText extends StatelessWidget {
  const StyledLargeText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        textStyle: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
