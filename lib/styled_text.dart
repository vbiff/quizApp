import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: const Color.fromARGB(255, 204, 162, 247),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
