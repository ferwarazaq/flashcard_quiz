import 'package:flutter/material.dart';

import 'homescreen.dart';


void main() {
  runApp(FlashcardQuizApp());
}

class FlashcardQuizApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return MaterialApp(
debugShowCheckedModeBanner: false,
      title: 'Flashcard Quiz',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
