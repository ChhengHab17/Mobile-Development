import 'package:uuid/uuid.dart';
import 'question.dart';
import 'answer.dart';
import 'submission.dart';

const uuid = Uuid();


class Quiz {
  final String quizid;
  final List<Answer> answers;
  final List<Question> questions;
  final List<Submission> submissions;

  Quiz({required this.questions, required this.answers, required this.submissions}) : quizid = uuid.v4();

  int calculateScore (){
    if (questions.isEmpty) return 0;
    int goodAnswersCount = answers.where((answer) => answer.isGoodAnswer()).length;
    return goodAnswersCount;
  }
  void addAnswer(Answer answer){
    answers.add(answer);
  }
  void saveSubmission() {
    Submission submission = Submission(
      answers: List.from(answers),
    );
    submissions.add(submission);
  }

  Map<String, dynamic> toJson() {
    return {
      'quizid': quizid,
      'questions': questions.map((q) => q.toJson()).toList(),
      'submissions': submissions.map((s) => s.toJson()).toList(),
    };
  }
  Quiz.fromJson(Map<String, dynamic> json)
      : quizid = json['quizid'] ?? uuid.v4(),
        questions = (json['questions'] as List? ?? [])
            .map((q) => Question.fromJson(q))
            .toList(),
        answers = [], // Always start with empty answers for new quiz
        submissions = (json['submissions'] as List? ?? [])
            .map((s) {
              // Rebuild questions first
              List<Question> questionsList = (json['questions'] as List? ?? [])
                  .map((q) => Question.fromJson(q))
                  .toList();
              return Submission.fromJson(s, questionsList);
            })
            .toList();
}
 