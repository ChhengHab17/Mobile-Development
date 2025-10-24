import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

void main() {
  Question q1 =
      Question(title: "2+2", choices: ["1", "2", "4"], goodChoice: "4", point: 10);

  Question q2 =
      Question(title: "2+3", choices: ["1", "2", "5"], goodChoice: "5", point: 20);

  late Quiz quiz;

  setUp(() {
    quiz = Quiz(questions: [q1, q2]);
  });

  test('Player 1 answers all correctly (100%)', () {
    final a1 = Answer(question: q1, answerChoice: "4");
    final a2 = Answer(question: q2, answerChoice: "5");

    final submission = Submission(playerName: 'p1', answers: [a1, a2]);
    quiz.addSubmission(submission);

    // Test scoring
    final score = quiz.getScore(submission);
    final percentage = quiz.scorePercentage(submission);
    
    expect(percentage, 100);
    expect(score, 30);
  });

  test('Player 2 has one correct and one wrong (50%)', () {

    final a1 = Answer(question: q1, answerChoice: "4");
    final a2 = Answer(question: q2, answerChoice: "6");

    final submission = Submission(playerName: 'p2', answers: [a1, a2]);
    quiz.addSubmission(submission);

    final score = quiz.getScore(submission);
    final percentage = quiz.scorePercentage(submission);
    
    expect(percentage, 50);
    expect(score, 10);
  });

  test('Player 3 answers all incorrectly (0%)', () {
    final a1 = Answer(question: q1, answerChoice: "1");
    final a2 = Answer(question: q2, answerChoice: "4");

    final submission = Submission(playerName: 'p3', answers: [a1, a2]);
    quiz.addSubmission(submission);

    final score = quiz.getScore(submission);
    final percentage = quiz.scorePercentage(submission);
    
    expect(percentage, 0);
    expect(score, 0);
  });
}