import 'question.dart';
import 'answer.dart';

class Submission {
  final DateTime date;
  final List<Answer> answers;

  Submission({
    required this.answers,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }
  
  Submission.fromJson(Map<String, dynamic> json, List<Question> questions)
      : date = DateTime.parse(json['date']),
        answers = (json['answers'] as List)
            .map((a) => Answer.fromJson(a, questions))
            .toList();
}