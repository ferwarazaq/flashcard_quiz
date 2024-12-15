import 'dart:math';
import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Flashcard> flashcards = [
    Flashcard(
      question: 'What is Flutter?',
      options: [
        'A programming language',
        'A UI toolkit for building natively compiled applications',
        'A database',
        'An operating system'
      ],
      correctAnswer: 'A UI toolkit for building natively compiled applications',
    ),
    Flashcard(
      question: 'What language is primarily used for Flutter development?',
      options: [
        'Java',
        'Dart',
        'Python',
        'Kotlin'
      ],
      correctAnswer: 'Dart',
    ),
    Flashcard(
      question: 'Which company developed Flutter?',
      options: [
        'Apple',
        'Facebook',
        'Google',
        'Microsoft'
      ],
      correctAnswer: 'Google',
    ),
    Flashcard(
      question: 'Which of the following is used to manage Flutter packages?',
      options: [
        'npm',
        'pub.dev',
        'pip',
        'composer'
      ],
      correctAnswer: 'pub.dev',
    ),
    Flashcard(
      question: 'What is the command to create a new Flutter project?',
      options: [
        'flutter run',
        'flutter new',
        'flutter create',
        'flutter init'
      ],
      correctAnswer: 'flutter create',
    ),
    Flashcard(
      question: 'Which widget is used for creating a scrollable list in Flutter?',
      options: [
        'Container',
        'Row',
        'Column',
        'ListView'
      ],
      correctAnswer: 'ListView',
    ),
    Flashcard(
      question: 'What is the default file name for the entry point of a Flutter app?',
      options: [
        'index.dart',
        'main.dart',
        'app.dart',
        'home.dart'
      ],
      correctAnswer: 'main.dart',
    ),
    Flashcard(
      question: 'Which method is used to change the state of a StatefulWidget?',
      options: [
        'setState',
        'build',
        'dispose',
        'initState'
      ],
      correctAnswer: 'setState',
    ),
    Flashcard(
      question: 'What is the purpose of the “hot reload” feature in Flutter?',
      options: [
        'To restart the app from scratch',
        'To quickly apply code changes without restarting the app',
        'To clear cache',
        'To update dependencies'
      ],
      correctAnswer: 'To quickly apply code changes without restarting the app',
    ),
    Flashcard(
      question: 'What does the Flutter widget tree represent?',
      options: [
        'The database structure',
        'The application’s visual layout',
        'The backend logic',
        'The project directory structure'
      ],
      correctAnswer: 'The application’s visual layout',
    ),
    Flashcard(
      question: 'Which widget is commonly used to display text in Flutter?',
      options: [
        'Text',
        'Label',
        'Paragraph',
        'Typography'
      ],
      correctAnswer: 'Text',
    ),


    Flashcard(
      question: 'What is Dart?',
      options: [
        'A programming language used by Flutter',
        'A database system',
        'A version control system',
        'An API library'
      ],
      correctAnswer: 'A programming language used by Flutter',
    ),
    // Add more flashcards here
  ];

  int currentIndex = 0;
  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    shuffleFlashcards(); // Shuffle at the beginning
  }

  /// Shuffle questions and options
  void shuffleFlashcards() {
    flashcards.shuffle();
    for (var flashcard in flashcards) {
      flashcard.options.shuffle();
    }
  }

  /// Go to the next question
  void nextQuestion(bool correct) {
    if (correct) {
      correctAnswers++;
    }

    setState(() {
      currentIndex++;
    });
  }

  /// Reset the quiz
  void resetQuiz() {
    setState(() {
      currentIndex = 0;
      correctAnswers = 0;
      shuffleFlashcards(); // Shuffle again when resetting
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= flashcards.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Quiz Finished', style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade700, Colors.purple.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Finished!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Correct Answers: $correctAnswers',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: resetQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.purple.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Question ${currentIndex + 1} of ${flashcards.length}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              flashcards[currentIndex].question,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...flashcards[currentIndex].options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    bool isCorrect = option == flashcards[currentIndex].correctAnswer;
                    nextQuestion(isCorrect);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
