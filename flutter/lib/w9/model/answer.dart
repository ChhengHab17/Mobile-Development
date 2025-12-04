import 'package:uuid/uuid.dart';
import 'question.dart';

const uuid = Uuid();

class Answer {
  final String aid;
  final String answerChoice;
  final Question question;

  Answer({required this.answerChoice, required this.question}) : aid = uuid.v4();

  bool isGoodAnswer (){
    return answerChoice == question.goodChoice;
  }

  Map<String, dynamic> toJson() {
    return {
      'aid': aid,
      'answerChoice': answerChoice,
      'questionId': question.qid,
    };
  }

  Answer.fromJson(Map<String, dynamic> json, List<Question> questions)
      : aid = json['aid'],
        answerChoice = json['answerChoice'],
        question = questions.firstWhere((q) => q.qid == json['questionId']);
}