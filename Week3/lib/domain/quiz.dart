class Question{
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question({required this.title, required this.choices, required this.goodChoice, this.point = 1});
}

class Answer{
  final Question question;
  final String answerChoice;
  

  Answer({required this.question, required this.answerChoice});

  bool isGood(){
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz{
  List<Question> questions;
  List <Answer> answers =[];

  Quiz({required this.questions});

  void addAnswer(Answer asnwer) {
     this.answers.add(asnwer);
  }

  ({int totalScore, int totalPoint}) getScoreInPercentage(){
    int totalSCore = 0;
    int totalPoint = 0;
    for(Answer answer in answers){
      if (answer.isGood()) {
        totalSCore++;
        totalPoint += answer.question.point;
      }
    }
    return (totalScore: ((totalSCore/ questions.length)*100).toInt(),totalPoint: totalPoint);

  }
}