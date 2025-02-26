import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(141, 255, 254, 250),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Take this Flutter Quiz', style: TextStyle(color: Color.fromARGB(147, 255, 255, 255), fontSize: 25)),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 153, 114, 204)),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
              style: TextStyle(color: Color.fromARGB(255, 153, 114, 204)),
            ),
          ),
        ],
      ),
    );
  }
}
