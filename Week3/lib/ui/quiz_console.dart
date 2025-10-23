import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;


  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');
    while(true){
      stdout.write('Your name: ');
      String? name = stdin.readLineSync();
      if (name == null || name.isEmpty) {
        print("---Quiz Finished---");
        break;
      }

      List<String> answerIds = [];
      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.point} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        if (userInput != null && userInput.isNotEmpty) {
          final a = quiz.addAnswer(questionId: question.qid, selectedChoice: userInput);
          answerIds.add(a.aid);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }

      final submission = Submission(playerName: name, answerIds: answerIds);
      quiz.addSubmission(submission);

      final score = quiz.getScore(submission);
      final percent = quiz.scorePercentage(submission);

      print('$name, Your score in percentage: $percent %');
      print('$name, Your score in points: $score');

      print('\n--- Players ---');
      quiz.submissions.forEach((playerName, sub) {
        final sc = quiz.getScore(sub);
        print('Player: $playerName   Score: $sc');
      });
    }
  }
}
 