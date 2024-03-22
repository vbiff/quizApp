class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledAnswers = List.of(answers); //creatre a copy List from elements
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
