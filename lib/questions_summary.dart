import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: data['correct_answer'] == data['user_answer'] ? const Color.fromARGB(252, 58, 161, 224) : const Color.fromARGB(122, 178, 65, 219),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          style: const TextStyle(color: Colors.white),
                          data['question'] as String,
                        ),
                        Text(
                          style: const TextStyle(color: Color.fromARGB(110, 227, 192, 252)),
                          data['user_answer'] as String,
                        ),
                        Text(
                          style: const TextStyle(color: Color.fromARGB(177, 132, 245, 122)),
                          data['correct_answer'] as String,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
