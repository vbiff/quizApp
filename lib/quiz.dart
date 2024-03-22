import 'package:flutter/material.dart';
import 'package:sec2/data/questions.dart';
import 'package:sec2/questions.dart';
import 'package:sec2/results_screen.dart';
import 'package:sec2/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions';
    });
  }

  void switchBack() {
    setState(() {
      activeScreen = 'start';
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions') {
      screenWidget = Questions(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == 'results') {
      screenWidget = ResultsScreen(
        choosenAnswers: selectedAnswers,
        switchBack: switchBack,
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: const Color.fromARGB(255, 47, 13, 104),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 63, 26, 126),
                Color.fromARGB(255, 84, 10, 138),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
