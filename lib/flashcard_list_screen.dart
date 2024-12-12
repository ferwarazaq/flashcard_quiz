import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class FlashcardListScreen extends StatefulWidget {
  @override
  _FlashcardListScreenState createState() => _FlashcardListScreenState();
}

class _FlashcardListScreenState extends State<FlashcardListScreen> {
  final List<Flashcard> flashcards = []; // List of flashcards
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  void addFlashcard() {
    setState(() {
      flashcards.add(
        Flashcard(
          question: questionController.text,
          answer: answerController.text,
        ),
      );
      questionController.clear();
      answerController.clear();
    });
  }

  void showAddFlashcardDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Flashcard'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: questionController,
                decoration: InputDecoration(labelText: 'Question'),
              ),
              TextField(
                controller: answerController,
                decoration: InputDecoration(labelText: 'Answer'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                addFlashcard();
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Flashcards')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: showAddFlashcardDialog,
            child: Text('Add Flashcard'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: flashcards.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(flashcards[index].question),
                  subtitle: Text(flashcards[index].answer),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
