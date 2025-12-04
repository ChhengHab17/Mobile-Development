import 'package:first_app/w9/model/quiz.dart';
import 'package:first_app/w9/model/answer.dart';
import 'package:first_app/w9/ui/widgets/question.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onFinish;
  const QuestionScreen({super.key, required this.quiz, required this.onFinish});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void _handleAnswerSelected(String selectedChoice) {
    Answer selectedAnswer = Answer(
      question: widget.quiz.questions[currentQuestionIndex],
      answerChoice: selectedChoice,
    );
    widget.quiz.addAnswer(selectedAnswer);

    if (currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      widget.onFinish();
    }
  }

  @override
  Widget build(BuildContext context) {
    return QuestionCard(
      question: widget.quiz.questions[currentQuestionIndex],
      onAnswerSelected: _handleAnswerSelected,
    );
  }
}
