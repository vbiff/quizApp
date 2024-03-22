import 'package:flutter/material.dart';
import 'package:sec2/styled_button.dart';
import 'package:sec2/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255), // Good practice for transparency
          ),
// BAD PRACTICE _______________________
          // Opacity(
          //   opacity: 0.8,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          //____________________________
          const SizedBox(
            height: 50,
          ),
          const StyledText('Learn Flutter the fun way!'),
          const SizedBox(
            height: 20,
          ),
          StyledButton(startQuiz),
        ],
      ),
    );
  }
}
