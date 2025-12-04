import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/answer.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestart;
  final VoidCallback onViewHistory;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.onRestart,
    required this.onViewHistory,
  });

  @override
  Widget build(BuildContext context) {
    int score = quiz.calculateScore();
    int total = quiz.questions.length;

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('You answered $score out of $total questions correctly!'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: quiz.answers.length,
              itemBuilder: (context, index) {
                return AnswerWidget(
                  answer: quiz.answers[index],
                  questionNumber: index + 1,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AppButton(
                  'Restart Quiz',
                  onTap: onRestart,
                  icon: Icons.refresh,
                ),
                SizedBox(height: 16),
                AppButton('History', onTap: onViewHistory, icon: Icons.history),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
