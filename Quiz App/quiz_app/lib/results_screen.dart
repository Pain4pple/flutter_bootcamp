import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz,{super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    
    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
      }
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(201, 255, 255, 255),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
            onPressed: restartQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 132, 77, 205)),
            icon: const Icon(Icons.restart_alt),
            label: const Text(
              "Restart Quiz!",
              style: TextStyle(color: Color.fromARGB(255, 132, 77, 205)),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
