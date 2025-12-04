import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Question {
  final String qid;
  final String title;
  final List<String> choices;
  final String goodChoice;

  Question({required this.title, required this.choices, required this.goodChoice}) : qid = uuid.v4(); 

  Map<String, dynamic> toJson() {
    return {
      'qid': qid,
      'title': title,
      'choices': choices,
      'goodChoice': goodChoice,
    };
  }
  Question.fromJson(Map<String, dynamic> json)
      : qid = json['qid'],
        title = json['title'],
        choices = List<String>.from(json['choices']),
        goodChoice = json['goodChoice'];
}