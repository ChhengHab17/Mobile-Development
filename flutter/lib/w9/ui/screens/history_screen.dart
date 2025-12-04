import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../../model/submission.dart';
import '../widgets/app_button.dart';
import '../widgets/history_card.dart';
class HistoryScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onBack;

  const HistoryScreen({
    super.key,
    required this.quiz,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    List<Submission> submissions = quiz.submissions.reversed.toList();

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('History (${submissions.length} attempts)'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: submissions.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.history, size: 80, color: Colors.white70),
                  const SizedBox(height: 20),
                  const Text(
                    'No quiz attempts yet',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 40),
                  AppButton('Back', onTap: onBack, icon: Icons.home),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: submissions.length,
                    itemBuilder: (context, index) {
                      Submission submission = submissions[index];
                      int score = submission.answers.where((a) => a.isGoodAnswer()).length;
                      int total = quiz.questions.length;
                      double percentage = (score / total) * 100;

                      return HistoryCard(percentage: percentage, score: score, total: total, submission: submission);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppButton('Back', onTap: onBack, icon: Icons.home),
                ),
              ],
            ),
    );
  }
}

