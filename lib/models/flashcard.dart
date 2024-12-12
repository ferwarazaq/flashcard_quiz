class Flashcard {
  final String question;
  final List<String> options; // List of options for answers
  final String correctAnswer; // Correct answer

  Flashcard({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}
