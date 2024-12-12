import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class FlashcardListScreen extends StatefulWidget {
  @override
  _FlashcardListScreenState createState() => _FlashcardListScreenState();
}

class _FlashcardListScreenState extends State<FlashcardListScreen> {
  final List<Flashcard> flashcards = []; // List of flashcards
  final TextEditingController questionController = TextEditingController();
  final TextEditingController correctAnswerController = TextEditingController();
  final List<String> options = []; // List of answer options

  // Method to add the flashcard to the list
  void addFlashcard() {
    setState(() {
      flashcards.add(
        Flashcard(
          question: questionController.text,
          options: options, // Options list
          correctAnswer: correctAnswerController.text,
        ),
      );
      // Clear the controllers and options after adding the flashcard
      questionController.clear();
      correctAnswerController.clear();
      options.clear();
    });
  }

  // Method to show the dialog for adding flashcards
  void showAddFlashcardDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Add Flashcard',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: questionController,
                  decoration: InputDecoration(
                    labelText: 'Question',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.deepPurple[400],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: correctAnswerController,
                  decoration: InputDecoration(
                    labelText: 'Correct Answer',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                   fillColor: Colors.deepPurple[400],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                addFlashcard(); // Add the flashcard
                Navigator.pop(context); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
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
      appBar: AppBar(
        title: Text('Manage Flashcards'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: showAddFlashcardDialog, // Show the dialog
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text(
                    'Add Flashcard',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: flashcards.isEmpty
                  ? Center(
                child: Text(
                  'No Flashcards Added Yet',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: flashcards.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        flashcards[index].question,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(flashcards[index].correctAnswer),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
