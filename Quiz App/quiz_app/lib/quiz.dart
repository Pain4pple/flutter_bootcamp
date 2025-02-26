import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/landing_page.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'landing-page';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = LandingPage(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        restartQuiz,
        chosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 162, 108, 215), Color.fromARGB(255, 227, 180, 255)],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: screenWidget,
      )),
    );
  }
}
