class Question {
  final String _title;
  final List<String> _choices;
  final String _goodChoice;

  Question(this._title, this._choices, this._goodChoice);

  String get title => _title;
  List<String> get choices => _choices;
  String get goodChoice => _goodChoice;
}

class Answer {
  final String _answerChoice;
  final Question question;

  Answer(this._answerChoice, this.question);

  String get answerChoice => _answerChoice;

  bool isGoodAnswer(){
    return _answerChoice == question.goodChoice;
  }
}

class Quiz{
  final List<Question> questions;
  final List<Answer> _answers = [];

  Quiz({required this.questions});

  List<Answer> get answer => _answers;

  void addAnswer (Answer answer){
    this._answers.add(answer);
  }

  int getScore(){
    return _answers.where((answer) => answer.isGoodAnswer()).length;
  }

}
void main() {
  final q1 = Question("What is 2 + 2?", ["1", "2", "4"], "4");
  final q2 = Question("Capital of France?", ["Paris", "Rome", "Berlin"], "Paris");
  final q3 = Question("Which planet is known as the Red Planet?", ["Earth", "Mars", "Jupiter"], "Mars");

  final quiz = Quiz(questions: [q1, q2, q3]);
  quiz.addAnswer(Answer("4", q1));
  quiz.addAnswer(Answer("Rome", q2));
  quiz.addAnswer(Answer("Mars", q3));

  print("Quiz Results");
  for (var ans in quiz.answer) {
    final result = ans.isGoodAnswer() ? "correct" : "incorrect";
    print("Q: ${ans.question.title}\nchoice: ${ans.question.choices}\nYour answer: ${ans.answerChoice}\n$result\n");
  }

  print("Total Score: ${quiz.getScore()}/${quiz.questions.length}");
}
