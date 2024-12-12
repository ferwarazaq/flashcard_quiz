import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Flashcard> flashcards = [
    Flashcard(question: 'What is Flutter?', answer: 'A UI toolkit for building natively compiled applications'),
    Flashcard(question: 'What is Dart?', answer: 'A programming language used by Flutter'),
    // Add more flashcards for the quiz here
  ];

  int currentIndex = 0;
  bool showAnswer = false;
  int correctAnswers = 0;

  void nextQuestion(bool correct) {
    if (correct) {
      correctAnswers++;
    }

    setState(() {
      currentIndex++;
      showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= flashcards.length) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz Finished')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Quiz Finished!'),
              Text('Correct Answers: $correctAnswers'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                    correctAnswers = 0;
                  });
                },
                child: Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Question: ${flashcards[currentIndex].question}', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          if (showAnswer) ...[
            Text('Answer: ${flashcards[currentIndex].answer}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => nextQuestion(true),
              child: Text('Correct'),
            ),
            ElevatedButton(
              onPressed: () => nextQuestion(false),
              child: Text('Incorrect'),
            ),
          ] else ...[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showAnswer = true;
                });
              },
              child: Text('Show Answer'),
            ),
          ],
        ],
      ),
    );
  }
}
