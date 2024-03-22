import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(this.pressed, {super.key});

  final void Function() pressed;

  @override
  Widget build(context) {
    return OutlinedButton.icon(
      onPressed: pressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      icon: const Icon(Icons.arrow_right_alt),
      label: const Text('Start Quiz'),
    );
  }
}
