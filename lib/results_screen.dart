import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sec2/data/questions.dart';
import 'package:sec2/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({required this.choosenAnswers, required this.switchBack, super.key});

  final List<String> choosenAnswers;
  final void Function() switchBack;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) => data['correct_answer'] == data['user_answer']).length;

    return SizedBox(
      width: double.infinity, // could be center
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 237, 192, 252),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              'You answered $numCorrectQuestions out of $numTotalQuestions question correctly!',
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: switchBack,
              icon: const Icon(Icons.refresh),
              label: const Text(
                style: TextStyle(color: Color.fromARGB(255, 235, 219, 254)),
                'Restart Quiz',
              ),
            )
          ],
        ),
      ),
    );
  }
}
