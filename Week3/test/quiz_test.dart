import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  // Create 2 questions and the quiz
  Question q1 =
      Question(title: "2+2", choices: ["1", "2", "4"], goodChoice: "4", point: 10);

  Question q2 =
      Question(title: "2+3", choices: ["1", "2", "5"], goodChoice: "5", point: 20);

  Quiz quiz = Quiz(questions: [q1, q2]);

  test('All answers are good (100%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "4");
    Answer a2 = Answer(question: q2, answerChoice: "5");

    quiz.answers = [a1, a2];

    // Check something
    var result = quiz.getScoreInPercentage();
    expect(result.totalScore, 100);
    expect(result.totalPoint, 30);
  });
  test('Some answer are not good', () {
    Answer a1 = Answer(question: q1, answerChoice: "4");
    Answer a2 = Answer(question: q2, answerChoice: "6");

    quiz.answers = [a1, a2];
  
    var result = quiz.getScoreInPercentage();
    expect(result.totalScore, 50);
    expect(result.totalPoint, 10);
  });

  test('All answer are not good', () {
    Answer a1 = Answer(question: q1, answerChoice: "1");
    Answer a2 = Answer(question: q2, answerChoice: "4");

    quiz.answers = [a1, a2];
    var result = quiz.getScoreInPercentage();
    expect(result.totalScore, 0);
    expect(result.totalPoint, 0);
  });

}