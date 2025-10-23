import 'package:uuid/uuid.dart';
var uuid = Uuid();

class Question{
  final String qid;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question({required this.title, required this.choices, required this.goodChoice, this.point = 1, String? qid}) : this.qid = qid ?? uuid.v4();
  Map<String, dynamic> toJson() => {
    'qid': qid,
    'title': title,
    'choices': choices,
    'goodChoice': goodChoice,
    'point': point,
  };

  Question.fromJson(Map<String, dynamic> j) : 
    qid = j['qid'] as String? ?? uuid.v4(),
    title = j['title'] as String,
    choices = List<String>.from(j['choices'] as List),
    goodChoice = j['goodChoice'] as String,
    point = (j['point'] ?? 1) as int;

}

class Answer{
  final String aid;
  final Question question;
  final String answerChoice;

  Answer({required this.question, required this.answerChoice, String? aid}) : this.aid = aid ?? uuid.v4();
  Map<String, dynamic> toJson() => {
        'id': aid,
        'questionId': question.qid,
        'selectedChoice': answerChoice,
      };

  Answer.fromJson(Map<String, dynamic> j):
        aid = j['id'] as String? ?? uuid.v4(),
        question = Question.fromJson(j['question'] as Map<String, dynamic>),
        answerChoice = j['selectedChoice'] as String;

  
  bool isGood(){
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz{
  final String quizid = uuid.v4();
  final List<Question> questions;
  final Map<String, Answer> answers = {};
  final Map<String, Submission> submissions = {}; 

  Quiz({required this.questions});

  Question getQuestionById(String qid){
    return questions.firstWhere((q) => q.qid == qid);
  }

  Answer getAnswerById(String aid) => answers[aid]!;

  Answer addAnswer({required String questionId, required String selectedChoice}) {
    final a = Answer(question: getQuestionById(questionId), answerChoice: selectedChoice);
    answers[a.aid] = a;
    return a;
  }

  int getScore(Submission submission) {
    int points = 0;

    for (final aid in submission.answerIds) {
      final a = answers[aid];
      if (a == null) continue;
      final q = questions.firstWhere((q) => q.qid == a.question.qid);
      if (a.isGood()) {
        points += q.point;
      }
    }
    return points;
  }
  int scorePercentage(Submission submission) {
    if (questions.isEmpty) return 0;
    
    int correctAnswers = 0;
    for (final aid in submission.answerIds) {
      final a = answers[aid];
      if (a != null && a.isGood()) {
        correctAnswers++;
      }
    }
    
    return ((correctAnswers / questions.length) * 100).round();
  }


  void addSubmission(Submission submission) {
    submissions[submission.playerName] = submission;
  }

  Map<String, dynamic> toJson() => {
        'questions': questions.map((q) => q.toJson()).toList(),
        'answers': answers.values.map((a) => a.toJson()).toList(),
        'submissions': submissions.values.map((s) => s.toJson()).toList(),
      };

  factory Quiz.fromJson(Map<String, dynamic> j) {
    final qs = (j['questions'] as List).map((e) => Question.fromJson(Map<String, dynamic>.from(e))).toList();
    final quiz = Quiz(questions: qs);

    final answersJson = j['answers'] as List;
    for (final ajson in answersJson) {
      final answerMap = Map<String, dynamic>.from(ajson);
      final questionId = answerMap['questionId'] as String;
      final question = quiz.getQuestionById(questionId);
      
      final answer = Answer(
        question: question, 
        answerChoice: answerMap['selectedChoice'] as String,
        aid: answerMap['id'] as String? ?? uuid.v4()
      );
      quiz.answers[answer.aid] = answer;
    }

    final subsJson = j['submissions'] as List;
    for (final sjson in subsJson) {
      final s = Submission.fromJson(Map<String, dynamic>.from(sjson));
      quiz.submissions[s.playerName] = s;
    }

    return quiz;
  }
}

class Submission {
  final String playerName;
  final List<String> answerIds;
  final DateTime date;

  Submission({
    required this.playerName,
    required this.answerIds,
    DateTime? date,
  }) : date = date ?? DateTime.now();
  Submission.fromJson(Map<String, dynamic> j) :
        playerName = j['playerName'] as String,
        answerIds = List<String>.from(j['answerIds'] as List),
        date = DateTime.parse(j['date'] as String);

  Map<String, dynamic> toJson() => {
        'playerName': playerName,
        'answerIds': answerIds,
        'date': date.toString(),
      };
}